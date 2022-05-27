import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/cubit/auth_bloc.dart';
import 'package:flutter/material.dart';

import '../../../help/notifications.dart';
import '../../custom_widet/custom_button_social.dart';
import '../../custom_widet/custom_default_button.dart';
import '../../custom_widet/custom_text_field.dart';

class LogInScreenforPatient extends StatefulWidget {
  const LogInScreenforPatient({Key? key}) : super(key: key);

  @override
  State<LogInScreenforPatient> createState() => _LogInScreenforPatientState();
}

class _LogInScreenforPatientState extends State<LogInScreenforPatient> {
  var controllar = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 227, 226, 226),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12, right: 105),
                child: CustomText(
                  text: "Login in your account",
                  color: Colors.black,
                  fontSise: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                controller: emailController,
                lableText: "Email",
                prefexIcon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 20.0,
              ),

              CustomTextField(
                controller: passwordController,
                lableText: "Passward",
                prefexIcon: Icons.lock_outlined,
                sufixIcon: Icons.password_outlined,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: "Forget passward ?",
                        color: Colors.black45,
                      )),
                ],
              ),
              const SizedBox(
                height: 18.0,
              ),
              CustomDefaultButton(
                text: "Log In",
                ontap: () {
                  validationInput();
                },
                height: 50,
                width: 260,
              ),
              const SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 90,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const CustomText(
                    text: "Or conected with",
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 1,
                    width: 90,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomButtonSocial(
                text: ' Facebook',
                onPress: () {},
                imageName: 'assets/images/facebook.png',
              ),

              const SizedBox(
                height: 15.0,
              ),
              CustomButtonSocial(
                text: ' Google',
                onPress: () {
                  AuthBloc().signInWithGoogle(
                      context: context, page: RoutsNames.homeScreenForPatient);
                },
                imageName: 'assets/images/google.png',
              ),

              //const CustomText(text: "Login in your account",color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }

  void validationInput() {
    if (emailController.text.isEmpty ||
        !emailController.text.contains('@') ||
        emailController.text.contains('doctor')) {
      Notifications.error(
          'Please enter correct email and not contain doctor word');
    } else if (passwordController.text.isEmpty) {
      Notifications.error('Please enter correct password');
    } else {
      AuthBloc().signIn(context, emailController.text, passwordController.text);
    }
  }
}
