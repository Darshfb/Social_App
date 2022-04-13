import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/layout/social_layout.dart';
import 'package:flutter_learning/modules/Login/cubit/login_cubit.dart';
import 'package:flutter_learning/modules/Login/cubit/login_states.dart';
import 'package:flutter_learning/modules/register/register_screen.dart';
import 'package:flutter_learning/shared/Local/cache_helper.dart';
import 'package:flutter_learning/shared/component.dart';

class SocialLogin extends StatelessWidget {
  SocialLogin({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (BuildContext context, state) {
        if (state is SocialLoginErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
        if (state is SocialLoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navigateAndFinish(context, const SocialLayout());
          }).catchError((error) {
            print('error when log in $error');
          });
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = SocialLoginCubit.get(context);
        return Form(
          key: _formKey,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50.0,
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
                              height: 20.0,
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
                            Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: CustomTextButton('Register now', () {
                                  navigateTo(context, RegisterScreen());
                                })),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.socialLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: const Text('LOGIN'),
                              color: Colors.green,
                              width: double.infinity,
                              hoverColor: Colors.red,
                              textColor: Colors.white,
                              height: 50.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 5.0,
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
