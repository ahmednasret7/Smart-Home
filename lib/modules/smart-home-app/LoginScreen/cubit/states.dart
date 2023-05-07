abstract class HomeLoginStates {}
class HomeLoginInitialState extends HomeLoginStates{}
class HomeLoginLoadingState extends HomeLoginStates{}
class HomeLoginSuccessState extends HomeLoginStates{}
class HomeLoginErrorState extends HomeLoginStates{
  final String error;
  HomeLoginErrorState(this.error);
}
class HomeChangePasswordVisibilityState extends HomeLoginStates{}
