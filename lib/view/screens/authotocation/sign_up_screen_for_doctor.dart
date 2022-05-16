import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../view_model/auth/cubit/auth_bloc.dart';
import '../../custom_widet/custom_button_social.dart';
import '../../custom_widet/custom_default_button.dart';
import '../../custom_widet/custom_text_field.dart';

class SignUpScreenForDoctor extends StatefulWidget {
  final int? signNumer;
  const SignUpScreenForDoctor({Key? key, this.signNumer}) : super(key: key);

  @override
  State<SignUpScreenForDoctor> createState() => _SignUpScreenForDoctorState();
}

class _SignUpScreenForDoctorState extends State<SignUpScreenForDoctor> {
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
                    children: const [
                      CustomTextField(
                          lableText: "Name", prefexIcon: Icons.person),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Email",
                        prefexIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Create password",
                        prefexIcon: Icons.lock_outlined,
                        sufixIcon: Icons.password_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Repeat password",
                        prefexIcon: Icons.lock_outlined,
                        sufixIcon: Icons.password_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Phone",
                        prefexIcon: Icons.phone_android_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Address",
                        // prefexIcon: Icons.addres,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Speciality",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Degree",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Location",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        lableText: "Booking Data",
                      ),
                      SizedBox(
                        height: 20.0,
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
                ontap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutsNames.homeScreenForDoctor);
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
                  AuthBloc().signInWithGoogle(context);
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
