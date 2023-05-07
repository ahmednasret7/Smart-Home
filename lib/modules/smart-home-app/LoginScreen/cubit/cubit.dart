

import 'package:dio_helper_flutter/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/LoginScreen/cubit/states.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';


class HomeLoginCubit extends Cubit<HomeLoginStates>
{
  HomeLoginCubit() : super(HomeLoginInitialState());

  static HomeLoginCubit get(context) => BlocProvider.of(context);

  void userLogin(
      {
        required String email,
        required String password,

})
  {
    emit(HomeLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(HomeLoginSuccessState());

    }).catchError((error){
      emit(HomeLoginErrorState(error.toString()));

    });




  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(HomeChangePasswordVisibilityState());
  }

}