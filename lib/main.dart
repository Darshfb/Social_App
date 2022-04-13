import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_learning/layout/cubit.dart';
import 'package:flutter_learning/layout/social_layout.dart';
import 'package:flutter_learning/modules/Login/cubit/login_cubit.dart';
import 'package:flutter_learning/modules/Login/social_login_screen.dart';
import 'package:flutter_learning/modules/register/cubit/register_cubit.dart';
import 'package:flutter_learning/shared/Local/cache_helper.dart';
import 'package:flutter_learning/shared/bloc_ovserve.dart';
import 'package:flutter_learning/shared/const.dart';
import 'package:flutter_learning/shared/styles/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      SocialLoginCubit();
      SocialRegisterCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  Widget widget;
  if (uId != null) {
    widget = const SocialLayout();
  } else {
    widget = SocialLogin();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

const MyApp({Key? key, required this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //print('................... $uId');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SocialLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()..getUserData(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
