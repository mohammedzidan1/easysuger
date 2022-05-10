import 'package:easysugar/view/custom_widet/custom_button.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_default_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameControllar = TextEditingController();
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
          child: Column(
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

                        decoration:  BoxDecoration(
                          color: const Color.fromARGB(255, 233, 231, 231),
                          borderRadius: BorderRadius.circular(20)
                        ),
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
                controller: nameControllar,
                onTap: () {
                  //nameControllar.text="";
                },
                lableText: "Name",
                width: MediaQuery.of(context).size.width * .8,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                controller: nameControllar,
                onTap: () {
                  //nameControllar.text="";
                },
                lableText: "Email",
                width: MediaQuery.of(context).size.width * .8,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                controller: nameControllar,
                onTap: () {
                  //nameControllar.text="";
                },
                lableText: "Phone",
                width: MediaQuery.of(context).size.width * .8,
              ),
              const SizedBox(
                height: 50.0,
              ),
              CustomDefaultButton(
                text: "Update",
                ontap: () {},
                height: 50,
                width: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
