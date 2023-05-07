import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/register/register_screen.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var Showpassword = true;

  @override
  Widget build(BuildContext context) {
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
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                      onChange: (email){
                        print(email);
                        },
                      onSubmit: (test){
                        print(test);
                        } ,

                  ),
                  SizedBox(height: 15.0),
                  defaultformField(
                    controller: passwordcontroller,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                    label: 'Password',
                    prefix: Icons.password_sharp,
                    suffix: Showpassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    suffixPressed: () {
                      setState(() {
                        Showpassword = !Showpassword;
                      });
                    },
                    isPassword: Showpassword,
                  ),
                  SizedBox(height: 15.0),
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        }
                      },
                      text: 'Login',
                      isUpperCase: false,
                  ),
                  SizedBox(height: 15.0),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailcontroller.text);
                        print(passwordcontroller.text);
                      }
                    },
                    text: 'Register',
                    isUpperCase: false,
                  ),

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
  }
}
