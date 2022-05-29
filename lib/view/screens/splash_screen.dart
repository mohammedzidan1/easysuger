import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easysugar/help/constant.dart';
import 'package:easysugar/view/screens/authotocation/regestration_screen.dart';
import 'package:easysugar/view/screens/doctor/doctor_home_screen.dart';
import 'package:easysugar/view/screens/patient_home_screen.dart';
import 'package:easysugar/view/screens/survey/Survey.page.dart';
import 'package:easysugar/view/start_screen.dart';
import 'package:easysugar/view_model/auth/auth.service.dart';
import 'package:flutter/material.dart';

import 'authotocation/follwar_screen.dart';

class MainSplashScrrn extends StatelessWidget {
  const MainSplashScrrn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    box.write('userType', 'Patient');
    Widget nextScreen() {
      var userT = box.read('userType');
      if (userT != null) {
        if (userT == 'Follower') {
          if (box.read('patientId') != '') {
            return const HomeScreen();
          } else {
            return FollwarScreen();
          }
        }
        if (AuthService.isLogin) {
          if (userT == 'Doctor') {
            return const HomeScreenForDoctor();
          } else if (userT == 'Patient') {
            if (box.read('SurveyState') == 'Complete') {
              return const HomeScreen();
            }
            return SurveyPage();
          }
        } else {
          if (userT == 'Doctor') {
            return const TapBarForRegestrationScreen(
              number: 2,
            );
          } else if (userT == 'Patient') {
            return const TapBarForRegestrationScreen(
              number: 1,
            );
          }
        }
        return AuthService.isLogin
            ? userT == 'Doctor'
                ? const HomeScreenForDoctor()
                : HomeScreen()
            : StartScreen();
      } else {
        return StartScreen();
      }
    }

    return AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 30,
        //    splash:const Image(image:  AssetImage("assets/images/icon.jpg") ,fit: BoxFit.fill,),
        splash: "assets/images/icon.jpg",
        nextScreen: nextScreen(),
        splashTransition: SplashTransition.slideTransition,

        // backgroundColor: Color(0xffE3F4FF),
        backgroundColor: Colors.white);
  }
}
