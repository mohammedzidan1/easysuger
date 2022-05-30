import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:easysugar/view_model/auth/cubit/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../../help/notifications.dart';
import '../../../help/routs/routs_name.dart';
import '../../custom_widet/custom_button_social.dart';
import '../../custom_widet/custom_default_button.dart';
import '../../custom_widet/custom_text_field.dart';

class LogInScreenforDoctor extends StatefulWidget {
  const LogInScreenforDoctor({Key? key}) : super(key: key);

  @override
  State<LogInScreenforDoctor> createState() => _LogInScreenforDoctorState();
}

class _LogInScreenforDoctorState extends State<LogInScreenforDoctor> {
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
                keyBordType: TextInputType.emailAddress,
                prefexIcon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 20.0,
              ),

              GetBuilder<AuthVeiwModel>(builder: (auth) {
                return CustomTextField(
                  obscureText: auth.isPassword,
                  controller: passwordController,
                  lableText: "Passward",
                  prefexIcon: Icons.lock_outlined,
                  sufixIcon: auth.suffix,
                  onTapS: () {
                    auth.changePasswordVisibility();
                  },
                );
              }),
              const SizedBox(
                height: 20.0,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //         onPressed: () {},
              //         child: const CustomText(
              //           text: "Forget passward ?",
              //           color: Colors.black45,
              //         )),
              //   ],
              // ),
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
                    width: 18.0,
                  ),
                  const CustomText(
                    text: " Or connected with",
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
                height: 20.0,
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
                      context: context, page: RoutsNames.homeScreenForDoctor);
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
        !emailController.text.contains('doctor')) {
      Notifications.error(
          'Please enter correct email and  contain doctor word');
    } else if (passwordController.text.isEmpty) {
      Notifications.error('Please enter correct password');
    } else {
      AuthVeiwModel authVeiwModel = Get.put(AuthVeiwModel());
      authVeiwModel.signIn(
          context, emailController.text, passwordController.text);
    }
  }
}
