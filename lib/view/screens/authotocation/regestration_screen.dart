import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/screens/authotocation/login_screen_for_doctor.dart';
import 'package:easysugar/view/screens/authotocation/sign_up_screen_for_doctor.dart';
import 'package:flutter/material.dart';
import 'log_in_screen_for_patient.dart';
import 'sign_up_screen_for_patient.dart';

class TapBarForRegestrationScreen extends StatelessWidget {
  final int? number;
  const TapBarForRegestrationScreen({Key? key, this.number}) : super(key: key);
  TabBar get _tabBar => const TabBar(
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600
            // backgroundColor: Colors.white
            ),
        tabs: [
          Tab(
            text: "Log In",
          ),
          Tab(
            text: "Sign Up",
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: const Color.fromARGB(255, 3, 164, 148),
          toolbarHeight: 140,
          title: Column(
            children: const [
              CustomText(
                text: "Easy Sugar",
                fontSise: 45.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "think about your health",
                fontSise: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            number == 1
                ? const LogInScreenforPatient()
                : const LogInScreenforDoctor(),
            number == 1
                ? SignUpScreenForPatient()
                : const SignUpScreenForDoctor(),
          ],
        ),
      ),
    );
  }
}
