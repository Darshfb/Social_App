import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/layout/social_layout.dart';
import 'package:flutter_learning/modules/Login/social_login_screen.dart';
import 'package:flutter_learning/modules/register/cubit/register_cubit.dart';
import 'package:flutter_learning/modules/register/cubit/register_states.dart';
import 'package:flutter_learning/shared/component.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (BuildContext context, state) {
          if (state is SocialCreateUserSuccessState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return SocialLayout();
            }));
          } else {
            print("hi");
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = SocialRegisterCubit.get(context);
          return Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 36.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                controller: userController,
                                keyboardType: TextInputType.name,
                                label: 'User Name',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSubmitted: (value) {},
                                prefixIcon: const Icon(Icons.person),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                label: 'Email Address',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onSubmitted: (value) {},
                                prefixIcon: Icon(Icons.email_rounded),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                label: 'Password',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSubmitted: (value) {},
                                prefixIcon: Icon(Icons.lock_outline_sharp),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.visibility)),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                label: 'Phone',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone';
                                  }
                                  return null;
                                },
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! SocialUserRegisterLoadingState,
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        builder: (BuildContext context) {
                          return CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.socialCreateUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  name: userController.text,
                                );
                              }
                            },
                            child: const Text('Register'),
                            color: Colors.green,
                            width: double.infinity,
                            hoverColor: Colors.red,
                            textColor: Colors.white,
                            height: 50.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 5.0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
