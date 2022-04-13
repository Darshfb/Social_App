import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/layout/cubit.dart';
import 'package:flutter_learning/layout/social_layout.dart';
import 'package:flutter_learning/layout/states.dart';
import 'package:flutter_learning/shared/component.dart';
import 'package:flutter_learning/shared/styles/colors.dart';
import 'package:flutter_learning/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {
        // if (state is! SocialUserUpdateLoadingState) {
        //   navigateWithoutBack(context, SocialLayout());
        // }
      },
      builder: (BuildContext context, Object? state) {
        var userModel = SocialCubit.get(context).userModel;
        var cubit = SocialCubit.get(context);
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        return Scaffold(
          appBar: DefaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              CustomTextButton('Update', () {
                cubit.updateUser(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text);
              }),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SocialUserUpdateLoadingState)
                    const LinearProgressIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.7,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        // Profile cover image
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage(
                                            '${userModel.coverImage}')
                                        : FileImage(coverImage)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.getCoverImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.camera,
                                    size: 18.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // profile user Image
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel.profileImage}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                              icon: const CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.camera,
                                  size: 18.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (cubit.profileImage != null || cubit.coverImage != null)
                    Row(
                      children: [
                        if (cubit.profileImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              CustomButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: defaultColor,
                                onPressed: () {
                                  cubit.uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                child: const Text('Upload Profile'),
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                const SizedBox(
                                  height: 5.0,
                                ),
                              if (state is SocialUserUpdateLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (cubit.coverImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              CustomButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: defaultColor,
                                onPressed: () {
                                  cubit.uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                child: const Text('Upload Cover'),
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                const SizedBox(
                                  height: 5.0,
                                ),
                              if (state is SocialUserUpdateLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  if (cubit.profileImage != null || cubit.coverImage != null)
                    const SizedBox(
                      height: 20.0,
                    ),
                  CustomTextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The name must not be empty';
                      }
                      return null;
                    },
                    label: 'User Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(IconBroken.user),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    controller: bioController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Bio must not be empty';
                      }
                      return null;
                    },
                    label: 'Bio',
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(IconBroken.infoCircle),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The phone must not be empty';
                      }
                      return null;
                    },
                    label: 'phone',
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(IconBroken.call),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
