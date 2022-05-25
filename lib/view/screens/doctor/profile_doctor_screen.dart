import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/notifications.dart';
import 'package:easysugar/model/doctor.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_widet/custom_default_button.dart';

class PrfileDoctorScreen extends StatelessWidget {
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
          child: ModelStreamSingleBuilder<Doctor>(
              docId: FirebaseAuth.instance.currentUser?.uid,
              onSuccess: (user) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customListTile(title: 'Address', trailing: user!.adress),
                    customListTile(
                        title: 'spiciality', trailing: user.spiciality),
                    customListTile(title: 'degree', trailing: user.degree),
                    customListTile(title: 'location', trailing: user.location),
                    customListTile(title: 'booking', trailing: user.booking),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomDefaultButton(
                      text: "Update",
                      ontap: () {
                        Notifications.dialog(context,
                            child: AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user.adress = value;
                                      },
                                      initValue: user.adress,
                                      // controller: addressController,
                                      lableText: "Addrees",

                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user.spiciality = value;
                                      },
                                      initValue: user.spiciality,
                                      lableText: "Speciality",
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user.degree = value;
                                      },
                                      initValue: user.degree,
                                      lableText: "Degree",
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user.location = value;
                                      },
                                      initValue: user.location,
                                      lableText: "Location",
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user.booking = value;
                                      },
                                      initValue: user.booking,
                                      lableText: "Booking Data",
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      await user.save(
                                          setOptions: SetOptions(merge: true));
                                      Navigator.pop(context);
                                      Notifications.success(
                                          'Success update profile information');
                                    },
                                    child: const Text('Save'))
                              ],
                            ));
                        // user.save(setOptions: SetOptions(merge: true));
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

  Widget customListTile({String? title, trailing}) {
    return ListTile(
      title: Text(
        title!,
        style: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsApp.primaryColor),
      ),
    );
  }
}
