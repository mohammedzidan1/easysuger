import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_widet/custom_curve.dart';
import 'custom_widet/custom_default_button.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  final AuthVeiwModel authVeiwModel = Get.put(AuthVeiwModel());
//lkjhgfdfghjkl7777777777777777777777777
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children:  [

          CustomBackground(),
          SizedBox(
              height: MediaQuery.of(context).size.height*.5,
              width: MediaQuery.of(context).size.width,
              child: const Image(

                  fit: BoxFit.scaleDown,
                  image: AssetImage("assets/images/main.png"))),
          Padding(
            padding: const EdgeInsets.only(top: 45,left: 7),
            child: Column(

              children: const [
                CustomText(text: "Welcome To",fontSise: 40,fontWeight: FontWeight.w500,),
                CustomText(text: "Easy Suger",fontSise: 50,fontWeight: FontWeight.bold,),
              ],
            ),
          )
          ,


          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*.35),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomDefaultButton(
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutsNames.tapBarForRegestrationScreen,
                          arguments: 1);

                      authVeiwModel.enterTypeOfUser('Patient');
                    },
                    text: "Patient",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDefaultButton(
                    text: "Doctor",
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutsNames.tapBarForRegestrationScreen,
                          arguments: 2);
                      authVeiwModel.enterTypeOfUser('Doctor');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDefaultButton(
                    text: "Follwar",
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutsNames.follwarScreen);
                      authVeiwModel.enterTypeOfUser('Follower');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
