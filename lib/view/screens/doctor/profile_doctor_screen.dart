import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import '../../custom_widet/custom_default_button.dart';

class PrfileDoctorScreen extends StatelessWidget {
  PrfileDoctorScreen({Key? key}) : super(key: key);

  var addressController = TextEditingController();
  var speicilityController = TextEditingController();
  var degreeController = TextEditingController();
  var locationController = TextEditingController();
  var bookingController = TextEditingController();

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
          text: "Profile",
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: addressController,
                      lableText: "Addrees",
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: speicilityController,
                      lableText: "Speciality",
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: degreeController,
                      lableText: "Degree",
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: locationController,
                      lableText: "Location",
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: bookingController,
                      lableText: "Booking Data",
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
