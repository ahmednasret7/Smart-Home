import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/register/cubit/cubit.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/register/cubit/states.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/smart_home_home_screen/smart_home_home_screen.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeRegisterCubit(),
      child: BlocConsumer<HomeRegisterCubit, HomeRegisterStates>(
        listener: (context, state){
          if(state is HomeCreateSuccessState) {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        defaultformField(
                          controller: namecontroller,
                          type: TextInputType.name,
                          validate : (String? value) {
                            if (value != null && value.isEmpty) {
                              return ('please enter your Username');
                            }
                          },
                          label: 'Username',
                          prefix: Icons.person,

                        ),

                        SizedBox(height: 15.0),
                        defaultformField(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate : (value) {
                            if (value != null && value.isEmpty) {
                              return ('please Enter your Email');
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,

                        ),
                        SizedBox(height: 15.0),
                        defaultformField(
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: HomeRegisterCubit.get(context).suffix,
                          onSubmit: (value)
                          {

                          },
                          isPassword: HomeRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            HomeRegisterCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Enter Password';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,

                        ),
                        SizedBox(height: 15.0),
                        defaultformField(
                          controller: phonecontroller,
                          type: TextInputType.phone,
                          validate : (String? value) {
                            if (value != null && value.isEmpty) {
                              return ('Enter Phone number');
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone_android,

                        ),
                        SizedBox(height: 15.0),
                        ConditionalBuilder(
                          condition: state is! HomeRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                HomeRegisterCubit.get(context).userRegister(
                                    name: namecontroller.text,
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    phone: phonecontroller.text,);

                              }
                            },
                            text: 'Register',
                            isUpperCase: true,
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),


                            // defaultTextButton(function: (){
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => RegisterScreen()),
                            //   );
                            // },
                            //     text: 'Register')
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
