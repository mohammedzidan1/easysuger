import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffE3F4FF),
      child: ModelStreamSingleBuilder<UserModel>(
          docId: FirebaseAuth.instance.currentUser?.uid,
          onSuccess: (user) {
            // print('userId ${FirebaseAuth.instance.currentUser?.uid}');
            return Column(children: [
              // Container(
              //   color: Colors.amber,
              // ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
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
                                  text: user?.userName,
                                  fontSise: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                // CustomText(
                                //   text: "Mohammedzidane@gmail.com",
                                //   fontSise: 15,
                                // )
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
                              children: [
                                const CustomText(
                                  text: "User Code",
                                  color: Colors.white,
                                  fontSise: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                CustomText(
                                  text: user?.email,
                                  color: Colors.black,
                                  fontSise: 16,
                                  fontWeight: FontWeight.w500,
                                )
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
                decoration: const BoxDecoration(
                    //   color: Color(0xff08877A),
                    ),
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(45),
                //     bottomRight: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("data"),
                  ],
                ),
              )
            ]);
          }),
    );
  }
}
