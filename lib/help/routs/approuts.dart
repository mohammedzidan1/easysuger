import 'package:easysugar/view/screens/add_record_screen.dart';
import 'package:easysugar/view/screens/authotocation/follwar_screen.dart';
import 'package:easysugar/view/screens/authotocation/regestration_screen.dart';
import 'package:easysugar/view/screens/doctor_home_screen.dart';
import 'package:easysugar/view/screens/emergency.dart';
import 'package:easysugar/view/screens/prediction_screen.dart';
import 'package:easysugar/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../view/screens/patient_home_screen.dart';
import '../../view/screens/settings_screen.dart';
import 'routs_name.dart';

class AppRouts {
  Route? genirateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutsNames.mainSplashScreen:
        return MaterialPageRoute(builder: (_) => const MainSplashScrrn());
      case RoutsNames.tapBarForRegestrationScreen:
        int number = settings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => TapBarForRegestrationScreen(number: number));
      case RoutsNames.follwarScreen:
        return MaterialPageRoute(builder: (_) => const FollwarScreen());
      case RoutsNames.homeScreenForPatient:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutsNames.predictionScreen:
        return MaterialPageRoute(builder: (_) => PredictionScreen());
      case RoutsNames.homeScreenForDoctor:
        return MaterialPageRoute(builder: (_) => const HomeScreenForDoctor());
      case RoutsNames.addRecordScreen:
        return MaterialPageRoute(builder: (_) => AddRecordScreen());
      case RoutsNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case RoutsNames.emergencyScreen:
        return MaterialPageRoute(builder: (_) => EmergencyPage());
    }
    return null;
  }
}
