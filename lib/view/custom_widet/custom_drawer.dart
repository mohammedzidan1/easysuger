import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import '../../view_model/auth/cubit/auth_bloc.dart';
import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Drawer(
        backgroundColor: const Color(0xffE3F4FF),
        child: ModelStreamSingleBuilder<UserModel>(
            docId: FirebaseAuth.instance.currentUser?.uid,
            onSuccess: (user) {
              // print('userId ${FirebaseAuth.instance.currentUser?.uid}');
              return Column(children: [
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutsNames.settingsScreen);
                                },
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                      "assets/images/icons8-meal-100.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: user?.displayName,
                                    fontSise: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  CustomText(
                                    text: user?.email,
                                    //  text: 'Mohmmedzidan@gmail.com.com',
                                    color: Colors.white,
                                    fontSise: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  CustomText(
                                    text: "User Code",
                                    color: Colors.white,
                                    fontSise: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  CustomText(
                                    text: "mm12#!",
                                    color: Colors.white,
                                    fontSise: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.wine_bar,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 185,
                    decoration: const BoxDecoration(
                        color: Color(0xff08877A),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45))),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDrawerItem(context, ontap: () {
                          Navigator.pushNamed(
                              context, RoutsNames.emergencyScreen);
                        },
                            text: "Emergency",
                            imagUrl: "assets/images/icons8-emergency-64.png",
                            fontSize: 23,
                            color: Colors.red),
                        buildDrawerItem(context,
                            text: "Medications ",
                            imagUrl: "assets/images/icons8-medications-64.png",
                            fontSize: 18),
                        buildDrawerItem(context,
                            text: "Analysis",
                            imagUrl:
                                "assets/images/icons8-glucose-meter-64.png",
                            fontSize: 18),
                        buildDrawerItem(context,
                            text: "Add record ",
                            imagUrl: "assets/images/icons8-add-column-30.png",
                            fontSize: 18),
                        buildDrawerItem(context,
                            text: "Get offer ",
                            imagUrl: "assets/images/icons8-recieve-48.png",
                            fontSize: 18),
                        buildDrawerItem(context, text: "update", fontSize: 18),
                        buildDrawerItem(context,
                            text: "Followers", fontSize: 18),
                        buildDrawerItem(context,
                            text: "Doctor reseervation", fontSize: 18),
                        buildDrawerItem(
                          context,
                          text: "contact with doctor",
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-new-contact-50.png",
                        ),
                        buildDrawerItem(
                          context,
                          text: "Report",
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-report-64.png",
                        ),
                        buildDrawerItem(
                          context,
                          text: "Settings",
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.settingsScreen);
                          },
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-settings-100.png",
                        ),
                        buildDrawerItem(
                          context,
                          ontap: () {
                            AuthBloc().logOut(context);
                          },
                          text: "Log out",
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-log-out-32.png",
                        ),
                      ],
                    ),
                  ),
                )
              ]);
            }),
      ),
    );
  }
}

Widget buildDrawerItem(context,
        {String? text,
        Function? ontap,
        String? imagUrl,
        Color? color = const Color.fromARGB(255, 112, 111, 111),
        double? fontSize}) =>
    InkWell(
      onTap: () {
        ontap!();
      },
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: text!,
                fontSise: fontSize,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              const SizedBox(
                width: 3,
              ),
              imagUrl != null
                  ? SizedBox(
                      height: 40, child: Image(image: AssetImage(imagUrl)))
                  : const SizedBox(
                      height: 30,
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width * .6,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
