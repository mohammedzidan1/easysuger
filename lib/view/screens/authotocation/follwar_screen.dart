import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/notifications.dart';
import 'package:easysugar/view/custom_widet/custom_default_button.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollwarScreen extends StatelessWidget {
  TextEditingController? patientController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();

  FollwarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 140),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: ColorsApp.primaryColor),
          child: Column(
            children: const [
              CustomText(
                text: "Welcom To ",
                fontSise: 25,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: "Easy Sugar ",
                fontSise: 50,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
    mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: CustomText(
                        text: "Enter the patient code to follow him",
                        color: Colors.black,
                        fontSise: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: this.patientController,
                  lableText: "Patient Code",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: nameController,
                  lableText: "Your Name",
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: phoneController,
                  lableText: "Your Phone number",
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomDefaultButton(
                  radius: 10.0,
                  text: "Start",
                  ontap: () {
                    validationInput();
                  },
                  width: 130,
                ),
              ],
            ),
          ),
          height: 450,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0)),
          ),
        ),
        SafeArea(
          child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))),
        )
      ]),
    );
  }

  validationInput() {
    if (nameController!.text.isEmpty) {
      Notifications.error('You must enter your name');
    } else if (patientController!.text.isEmpty) {
      Notifications.error('You must enter patient code');
    } else if (phoneController!.text.isEmpty) {
      Notifications.error('You must enter your phone');
    } else {
      AuthVeiwModel auth = Get.put(AuthVeiwModel());
      auth.signInAsFollower(
          patientCode: patientController?.text.trim(),
          name: nameController?.text,
          phoneNum: phoneController?.text);
      print('FId2 ${auth.followerId}');
    }
  }
}
