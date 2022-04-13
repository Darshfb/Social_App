import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/layout/cubit.dart';
import 'package:flutter_learning/layout/states.dart';
import 'package:flutter_learning/modules/new_post/new_post_screen.dart';
import 'package:flutter_learning/modules/notifications/notification_screen.dart';
import 'package:flutter_learning/modules/search/search_screen.dart';
import 'package:flutter_learning/shared/Local/cache_helper.dart';
import 'package:flutter_learning/shared/component.dart';
import 'package:flutter_learning/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {
        if (state is SocialAddPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = SocialCubit.get(context);
        var isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        print('Is Email verified $isEmailVerified');
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, NotificationScreen());
                  },
                  icon: const Icon(IconBroken.notification)),
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(IconBroken.search)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.home), label: 'Feed'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.upload), label: 'Add post'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.location), label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.setting), label: 'settings'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
