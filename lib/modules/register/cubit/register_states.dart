abstract class SocialRegisterStates{}

class InitialRegisterState extends SocialRegisterStates{}

class SocialUserRegisterLoadingState extends SocialRegisterStates {}

class SocialUserRegisterSuccessState extends SocialRegisterStates {}

class SocialUserRegisterErrorState extends SocialRegisterStates {
  final String error;

  SocialUserRegisterErrorState(this.error);
}

class SocialCreateUserLoadingState extends SocialRegisterStates {}

class SocialCreateUserSuccessState extends SocialRegisterStates {}

class SocialCreateUserErrorState extends SocialRegisterStates {
  final String error;

  SocialCreateUserErrorState(this.error);
}