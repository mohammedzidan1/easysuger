import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_default_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const CustomText(
          text: "Settings",
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: ModelSingleBuilder<UserModel>(
              docId: FirebaseAuth.instance.currentUser?.uid,
              onSuccess: (user) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/images/icons8-meal-100.png"),
                          ),
                          Container(
                              margin: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 233, 231, 231),
                                  borderRadius: BorderRadius.circular(20)),
                              child: IconButton(
                                  //  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                  )))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: nameController,
                      lableText: user?.displayName,
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: emailController,
                      lableText: user?.email,
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      lableText: user?.numPhone,
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomDefaultButton(
                      text: "Update",
                      ontap: () {
                        user?.save(setOptions: SetOptions(merge: true));
                      },
                      height: 50,
                      width: 260,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  // bool isUpdate(UserModel? user) {
  //   if (user?.email == emailController.text ||
  //       user?.userName == nameController.text ||
  //       user?.numPhone == phoneController.text) {
  //     return false;
  //   }
  //   ;
  //   return true;
  // }
}
