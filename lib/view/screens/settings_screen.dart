import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../help/notifications.dart';
import '../../service/firebase_storage.dart';
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
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            height: 170,
                            width: 170,
                            child: user?.imageUrl == ''
                                ? Image.asset(
                                    'assets/images/icons8-meal-100.png')
                                : Image.network(
                                    user!.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 233, 231, 231),
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                              //  color: Colors.white,
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,

                                  // allowedExtensions: ['jpg', ],
                                );

                                String? path = result?.paths[0];
                                if (path != null) {
                                  print('path $path');
                                  String? imageUrl =
                                      await FirebaseStorageService.uploadFile(
                                          path);
                                  await user
                                      ?.update(data: {'imageUrl': imageUrl});
                                }
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    customListTile(title: 'Name', trailing: user?.displayName),
                    customListTile(title: 'Email', trailing: user?.email),
                    customListTile(title: 'Phone', trailing: user?.numPhone),
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
                                        user?.displayName = value;
                                      },
                                      initValue: user?.displayName,
                                      lableText: 'name',
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user?.email = value;
                                      },
                                      initValue: user?.email,
                                      lableText: 'Email',
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    UpdateCustomTextField(
                                      onChanged: (value) {
                                        user?.numPhone = value;
                                      },
                                      initValue: user?.numPhone,
                                      lableText: 'Phone',
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                CustomDefaultButton(
                                  text: "Save",
                                  ontap: () async {
                                    await user?.save(
                                        setOptions: SetOptions(merge: true));
                                    Navigator.pop(context);
                                    Notifications.success(
                                        'Success update settings information');
                                  },
                                  height: 50,
                                  width: 260,
                                ),
                              ],
                            ));
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
          color: ColorsApp.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: GoogleFonts.cairo(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
