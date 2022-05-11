import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/cubit/auth_bloc.dart';
import 'package:flutter/material.dart';

import '../../custom_widet/custom_button_social.dart';
import '../../custom_widet/custom_default_button.dart';
import '../../custom_widet/custom_text_field.dart';

class SignUpScreenForPatient extends StatefulWidget {
  @override
  State<SignUpScreenForPatient> createState() => _SignUpScreenForPatientState();
}

class _SignUpScreenForPatientState extends State<SignUpScreenForPatient> {
  AuthBloc authBloc = AuthBloc();
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 12, right: 10),
                  child: CustomText(
                    text: "Let's care about our health",
                    color: Color(
                      0xff292929,
                    ),
                    fontSise: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20.0,
              ),

              Container(
                height: 200,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: nameController,
                          lableText: "Name",
                          prefexIcon: Icons.person),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: emailController,
                        lableText: "Email",
                        prefexIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        lableText: "Create password",
                        prefexIcon: Icons.lock_outlined,
                        sufixIcon: Icons.password_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: confirmPasswordController,
                        lableText: "Repeat password",
                        prefexIcon: Icons.lock_outlined,
                        sufixIcon: Icons.password_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: phoneController,
                        lableText: "Phone",
                        prefexIcon: Icons.phone_android_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: ageController,
                        lableText: "Age",
                        prefexIcon: Icons.man,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: genderController,
                        lableText: "Male/female",
                        prefexIcon: Icons.male_outlined,
                      ),
                    ],
                  ),
                ),
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
                text: "Sign Up",
                ontap: () async {
                  print(emailController.text);
                  print(passwordController.text);
                  UserModel userModel = UserModel(
                    displayName: nameController.text,
                    userName: nameController.text,
                    email: emailController.text,
                    numPhone: phoneController.text,
                    age: ageController.text,
                    gender: genderController.text,
                    password: passwordController.text,
                  );
                  authBloc.createAccount(
                      userModel: userModel, context: context);
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
                onPress: () {
                  AuthBloc().signInWithFacebook();
                },
                imageName: 'assets/images/facebook.png',
              ),

              const SizedBox(
                height: 15.0,
              ),
              CustomButtonSocial(
                text: ' Google',
                onPress: () {
                  AuthBloc().signInWithGoogle(context);
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
}
