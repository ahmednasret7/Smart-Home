import 'package:flutter/material.dart';
class UserModel {
  late String name;
  late String phone;
  late String email;
  late String uId;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
  });

  UserModel.formJson(Map<String, dynamic>json){
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap(){
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    };
  }
}