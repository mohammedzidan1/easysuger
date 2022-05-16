import 'package:easysugar/model/follower.dart';
import 'package:easysugar/view/screens/patient_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:get/get.dart';

import '../../model/users.dart';

class AuthVeiwModel extends GetxController {
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
}
