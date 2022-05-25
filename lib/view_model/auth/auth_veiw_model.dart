import 'package:easysugar/help/constant.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/doctor.dart';
import 'package:easysugar/model/follower.dart';
import 'package:easysugar/view/screens/patient_home_screen.dart';
import 'package:easysugar/view_model/auth/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../help/notifications.dart';
import '../../model/users.dart';

class AuthVeiwModel extends GetxController {
  String? userType;
  UserModel? user;
  Future<void> getUserData() async {
    User? userF = FirebaseAuth.instance.currentUser;
    if (userF != null) {
      UserModel? userModel =
          await FirestoreModel.use<UserModel>().find(userF.uid);
      //print("uid ${userModel.uId}");
      user = userModel;
      update();

      print("userF ${userF}");
      print("userModel ${user?.toMap}");

      print("stateUserId ${user?.docId}");
    }
  }

  String? followerId;
  signInAsFollower({String? phoneNum, patientCode, name}) async {
    print('id $patientCode');
    UserModel? userModel =
        await FirestoreModel.use<UserModel>().find(patientCode);
    print('user ${userModel?.toMap}');
    user = userModel;
    update();

    if (userModel != null) {
      Follower? follower = userModel?.subCollection<Follower>();
      follower?.type = 'follower';
      follower?.phoneNum = phoneNum!;
      follower?.patientCode = patientCode!;
      follower?.name = name!;
      await follower?.create();
      followerId = follower?.patientCode;
      update();
      Get.to(() => HomeScreen());

      print('FId $followerId');
    }
  }

  void enterTypeOfUser(String userT) {
    box.write('userType', userT);
    userType = userT;
    update();
  }

  void createAccountForDoctor({context, Doctor? doctor}) async {
    User? user = await AuthService().register(doctor!.email, doctor.password);
    if (user != null) {
      doctor.docId = user.uid;
      await doctor.create(docId: user.uid);
      Navigator.pushReplacementNamed(context, RoutsNames.homeScreenForDoctor);
    } else {
      print('user not found');
    }
  }

  void signIn(context, String email, String password) async {
    User? user = await AuthService().signIn(email, password);
    if (user != null) {
      await getUserData();
      Navigator.pushReplacementNamed(context, RoutsNames.homeScreenForDoctor);
      Notifications.success('تم تسجيل الدخول بنجاح');
      // Modular.to.pushReplacementNamed(AppRoutes.mainHome);
    }
  }

  void logOutForDoctor(context) async {
    await AuthService().logout();
    Navigator.pushReplacementNamed(
        context, RoutsNames.tapBarForRegestrationScreen,
        arguments: 2);
  }
}
