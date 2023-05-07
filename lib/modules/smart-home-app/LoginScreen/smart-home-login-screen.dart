import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/LoginScreen/cubit/cubit.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/LoginScreen/cubit/states.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/register/register_screen.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';

class SmartLoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var Showpassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeLoginCubit(),
      child: BlocConsumer<HomeLoginCubit, HomeLoginStates>(
        listener: (context, state)
        {
          if(state is HomeLoginErrorState){
            Fluttertoast.showToast(
              msg: state.error,

            );
          }
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        defaultformField(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate : (String? value) {
                            if (value!.isEmpty) {
                              return ('Enter Email');
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,

                        ),
                        SizedBox(height: 15.0),
                        defaultformField(
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: HomeLoginCubit.get(context).suffix,
                          onSubmit: (value)
                          {
                            if (formKey.currentState!.validate())
                            {
                              // HomeLoginCubit.get(context).userLogin(
                              //   email: emailcontroller.text,
                              //   password: passwordcontroller.text,
                              // );

                            }
                          },
                          isPassword: HomeLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            HomeLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Password';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.password_sharp,

                        ),
                        SizedBox(height: 15.0),

                        ConditionalBuilder(
                          condition: state is HomeLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                HomeLoginCubit.get(context).userLogin(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                );
                              }
                            },
                            text: 'Login',
                            isUpperCase: false,
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 15.0),
                        // defaultButton(
                        //   function: () {
                        //     if (formKey.currentState!.validate()) {
                        //       print(emailcontroller.text);
                        //       print(passwordcontroller.text);
                        //     }
                        //   },
                        //   text: 'Register',
                        //   isUpperCase: false,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            defaultTextButton(function: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterScreen()),
                              );
                            },
                                text: 'Register')
                          ],
                        ),
                      ],
                    ),
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
