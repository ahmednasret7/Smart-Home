


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/models/user/user_model.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/register/cubit/states.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';


class HomeRegisterCubit extends Cubit<HomeRegisterStates>
{
  HomeRegisterCubit() : super(HomeRegisterInitialState());

  static HomeRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {
        required String name,
        required String email,
        required String password,
        required String phone,

})
  {
    emit(HomeRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
    .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(name: name, email: email, phone: phone, uId: value.user!.uid,);

      emit(HomeRegisterSuccessState());
    })
    .catchError((error){
      emit(HomeRegisterErrorState(error.toString()));
    });


  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
})
  {
    UserModel model = UserModel(name: name, email: email, phone: phone, uId: uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(HomeCreateSuccessState());
        }).catchError((error){
          emit(HomeCreateErrorState(error.toString()));
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