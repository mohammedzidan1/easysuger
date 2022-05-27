import 'package:bloc/bloc.dart';
import 'package:easysugar/help/notifications.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/perdictions.dart';
import 'package:easysugar/model/rebort.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view_model/auth/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  late AuthService? authService;

  AuthBloc({this.authService}) : super(AuthState(user: UserModel()));

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserModel? userModel =
          await FirestoreModel.use<UserModel>().find(user.uid);
      //print("uid ${userModel.uId}");
      emit(state.copyWith(user: userModel));
      print("userF ${user}");
      print("userModel ${state.user?.toMap}");

      print("stateUserId ${state.user?.docId}");
    }
  }

  userModel() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    UserModel? userModel = await FirestoreModel.use<UserModel>().find(id!);
    return userModel!;
  }

  void logOut(context) async {
    await AuthService().logout();
    Navigator.pushReplacementNamed(
        context, RoutsNames.tapBarForRegestrationScreen,
        arguments: 1);
  }

  void createAccount({context, UserModel? userModel}) async {
    User? user =
        await AuthService().register(userModel!.email, userModel.password);
    if (user != null) {
      userModel.docId = user.uid;
      await userModel.create(docId: user.uid);
      Navigator.pushReplacementNamed(context, RoutsNames.homeScreenForPatient);
    } else {
      print('user not found');
    }
  }

  void signIn(context, String email, String password) async {
    User? user = await AuthService().signIn(email, password);
    if (user != null) {
      await getUserData();
      Navigator.pushReplacementNamed(context, RoutsNames.homeScreenForPatient);
      // Notifications.success('تم تسجيل الدخول بنجاح');
      // Modular.to.pushReplacementNamed(AppRoutes.mainHome);
    }
    // print('provider: ${user.providerData.single.providerId}');}
    // if (user.emailVerified == true) {
    //   print(user.emailVerified);
    //   print('finish verify email');
    //   Notifications.success('تم تسجيل الدخول بنجاح');
    //   Modular.to.pushReplacementNamed(AppRoutes.mainHome);
    // }
    else {
      /*await _authService.logout();
        print(user.emailVerified);
        Notifications.dialog(
          context,
          dismissible: true,
          child: Dialog(
            child: Container(
              // height: 120,
              child: const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'You must verify your email',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        );*/
      print('loading verify email');
    }
  }

  void signInWithGoogle({context, String? page}) async {
    UserCredential? user = await AuthService().signInWithGoogle();
    print(user.user!.email);

    if (user.user != null) {
      UserModel userModel = UserModel.fromAuth(user.user!);
      if (!await userModel.exists(user.user!.uid)) {
        await userModel.create(docId: user.user!.uid);
      }
      print('provider: ${user.user!.providerData.single.providerId}');
      await getUserData();
      Navigator.pushReplacementNamed(context, page!);

      // Modular.to.pushReplacementNamed(AppRoutes.mainHome);

    } else {}
  }

  void signInWithFacebook() async {
    UserCredential user = await AuthService().signInWithFaceBook();
    print('email${user.user?.email!}');
    print('phoneNumber${user.user?.phoneNumber}');
    print('displayName${user.user?.displayName}');

    if (user.user != null) {
      UserModel userModel = UserModel.fromAuth(user.user!);
      if (!await userModel.exists(userModel.docId!)) {
        await userModel.create(docId: userModel.docId!);
      }
      print('provider: ${user.user?.providerData.single.providerId}');
      await getUserData();
      // Modular.to.pushReplacementNamed(AppRoutes.mainHome);
    }
  }

  void createPrediction(String date, time, gluco, activityType, duration, meal,
      cal, carbs) async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel? userModel =
        await FirestoreModel.use<UserModel>().find(user!.uid);
    Prediction? prediction = userModel?.subCollection<Prediction>();
    prediction?.date = date;
    prediction?.time = time;
    prediction?.glucose = gluco;
    prediction?.lunch = meal;
    prediction?.activityType = activityType;
    prediction?.duration = duration;
    prediction?.cal = cal;
    prediction?.carbs = cal;
    await prediction?.create();
  }

  void createReport(
    context,
    String date,
    time,
    fasting,
    reminder,
    pills,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel? userModel =
        await FirestoreModel.use<UserModel>().find(user!.uid);
    Report? report = userModel?.subCollection<Report>();
    report?.uId = user.uid;
    report?.date = date;
    report?.time = time;

    report?.fasting = fasting;
    report?.reminder = reminder;
    report?.pills = pills;

    await report?.create();
    Notifications.success('success create report');
    Navigator.pop(context);
  }

  void createSurvey({
    String? survey1,
    String? survey2,
    String? survey3,
    String? survey4,
    String? survey5,
    String? survey6,
    String? survey7,
    String? survey8,
    String? survey9,
    String? survey10,
    String? survey11,
    String? survey12,
    String? survey13,
    String? survey14,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel? userModel =
        await FirestoreModel.use<UserModel>().find(user!.uid);
    Survey? survey = userModel?.subCollection<Survey>();
  }
}
