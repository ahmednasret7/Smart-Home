abstract class HomeRegisterStates {}
class HomeRegisterInitialState extends HomeRegisterStates{}
class HomeRegisterLoadingState extends HomeRegisterStates{}
class HomeRegisterSuccessState extends HomeRegisterStates{}
class HomeRegisterErrorState extends HomeRegisterStates{
  final String error;
  HomeRegisterErrorState(this.error);
}

class HomeCreateSuccessState extends HomeRegisterStates{}
class HomeCreateErrorState extends HomeRegisterStates{
  final String error;
  HomeCreateErrorState(this.error);
}


class HomeChangePasswordVisibilityState extends HomeRegisterStates{}
