import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easysugar/view/screens/authotocation/regestration_screen.dart';
import 'package:easysugar/view/screens/patient_home_screen.dart';
import 'package:easysugar/view/start_screen.dart';
import 'package:easysugar/view_model/auth/auth.service.dart';
import 'package:flutter/material.dart';

class MainSplashScrrn extends StatelessWidget {
  const MainSplashScrrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 30,
        //    splash:const Image(image:  AssetImage("assets/images/icon.jpg") ,fit: BoxFit.fill,),
        splash: "assets/images/icon.jpg",
        nextScreen: AuthService.isLogin 
            ? const HomeScreen()
            : const StartScreen(),
        splashTransition: SplashTransition.slideTransition,

        // backgroundColor: Color(0xffE3F4FF),
        backgroundColor: Colors.white);
  }
}