import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/layout/states.dart';
import 'package:flutter_learning/models/social_user_model.dart';
import 'package:flutter_learning/modules/chats/chat_screen.dart';
import 'package:flutter_learning/modules/feeds/feed_screen.dart';
import 'package:flutter_learning/modules/new_post/new_post_screen.dart';
import 'package:flutter_learning/modules/settings/setting_screen.dart';
import 'package:flutter_learning/modules/user/user_screen.dart';
import 'package:flutter_learning/shared/const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialSocialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    FeedScreen(),
    ChatScreen(),
    NewPostScreen(),
    UserScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialAddPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  SocialUserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data()!);
      print('my data is >>>>>>>> ${value.data()}');
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print('error when get my data ${error.toString()}');
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  File? profileImage;
  File? coverImage;

  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('no Image selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('no Image selected');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // profileImage = value.toString() as File?;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          profileImage: value,
        );
        // emit(SocialUploadProfileImageSuccessState());
        print(value.toString());
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // coverImageUrl = value;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          coverImage: value,
        );
       // emit(SocialUploadCoverImageSuccessState());
        print(value.toString());
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  // void updateUserImage({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(SocialUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (coverImage != null && profileImage != null) {
  //     uploadProfileImage();
  //     uploadCoverImage();
  //   } else {
  //     updateUserData(name: name, phone: phone, bio: bio);
  //   }
  // }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? coverImage,
    String? profileImage,
  }) {
    SocialUserModel model = SocialUserModel(
        name: name,
        email: userModel!.email,
        phone: phone,
        uId: uId,
        isEmailVerified: false,
        bio: bio,
        coverImage: coverImage ?? userModel!.coverImage,
        profileImage: profileImage ?? userModel!.profileImage);

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError(
      (error) {
        emit(SocialUserUpdateErrorState());
      },
    );
  }
}
