import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/models/social_user_model.dart';
import 'package:flutter_learning/modules/register/cubit/register_states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(InitialRegisterState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void socialCreateUser(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(SocialUserRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('>>>>>>>>>>>>>>>>>>>>>${value.user!.email}');
      userCreate(email: email, uId: value.user!.uid, name: name, phone: phone);
    }).catchError(
      (error) {
        print('error when register ${error.toString()}');
        emit(SocialUserRegisterErrorState(error.toString()));
      },
    );
  }

  void userCreate(
      {required String email,
      required String uId,
      required String name,
      required String phone}) {
    SocialUserModel model = SocialUserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
      bio: 'Write your Bio...',
      coverImage:
          'https://img.freepik.com/free-photo/white-painted-wall-texture-background_53876-138197.jpg?t=st=1649777138~exp=1649777738~hmac=872bc2756785f68ac42e1e3cb972a83b496c14f2de4f4b7f71c2e408ed22abd0&w=740',
      profileImage:
          'https://img.freepik.com/free-vector/vector-flat-grayscale-businessman-avatar-illustration-default-userpic_574806-348.jpg?w=740',
    );
    emit(SocialCreateUserLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      print('>>>>>>> ${error.toString()}');
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }
}
