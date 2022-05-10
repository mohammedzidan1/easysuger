import 'package:bloc/bloc.dart';
import 'package:easysugar/help/routs/routs_name.dart';
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
      print("userModel ${userModel}");
    }
  }

  void logOut(context) async {
    await AuthService().logout();
    Navigator.pushReplacementNamed(context, RoutsNames.tapBarForRegestrationScreen,arguments: 1);
  }

  void createAccount({context, UserModel? userModel}) async {
    User? user =
        await AuthService().register(userModel!.email, userModel.password);
    if (user != null) {
      userModel?.docId = user.uid;
      await userModel?.create(docId: user.uid);
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
}
