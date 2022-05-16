import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/doctor.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'custom_text.dart';

class CustomDoctorDrawer extends StatelessWidget {
  const CustomDoctorDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Drawer(
        backgroundColor: const Color(0xffE3F4FF),
        child: ModelStreamSingleBuilder<Doctor>(
            docId: FirebaseAuth.instance.currentUser?.uid,
            onSuccess: (user) {
              // print('userId ${FirebaseAuth.instance.currentUser?.uid}');
              return Column(children: [
                SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.doctorsettingsScreen);
                          },
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/icons8-meal-100.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        buildDrawerItem(
                          context,
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.consultingDoctorScreen);
                          },
                          text: "Consulting",
                          fontSize: 18,
                        ),
                        buildDrawerItem(
                          context,
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.doctorProfileScreen);
                          },
                          text: "Profile",
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-customer-16.png",
                        ),
                        buildDrawerItem(
                          context,
                          text: "Settings",
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.doctorsettingsScreen);
                          },
                          fontSize: 18,
                          imagUrl: "assets/images/icons8-settings-100.png",
                        ),
                        buildDrawerItem(
                          context,
                          ontap: () {
                            Get.put(AuthVeiwModel()).logOutForDoctor(context);
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
