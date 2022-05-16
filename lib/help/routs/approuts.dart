import 'package:easysugar/view/screens/add_record_screen.dart';
import 'package:easysugar/view/screens/analysis_screen.dart';
import 'package:easysugar/view/screens/authotocation/follwar_screen.dart';
import 'package:easysugar/view/screens/authotocation/regestration_screen.dart';
import 'package:easysugar/view/screens/contact_with_doctor.dart';
import 'package:easysugar/view/screens/doctor/consulting_doctor_screen.dart';
import 'package:easysugar/view/screens/doctor/doctor_home_screen.dart';
import 'package:easysugar/view/screens/doctor/profile_doctor_screen.dart';
import 'package:easysugar/view/screens/doctor/settings_doctor_screen.dart';
import 'package:easysugar/view/screens/doctor_reseervation.dart';
import 'package:easysugar/view/screens/emergency.dart';
import 'package:easysugar/view/screens/follwer_name_screen.dart';
import 'package:easysugar/view/screens/get_offer_screen.dart';
import 'package:easysugar/view/screens/medication_screen.dart';
import 'package:easysugar/view/screens/prediction_screen.dart';
import 'package:easysugar/view/screens/rebort_screen.dart';
import 'package:easysugar/view/screens/splash_screen.dart';
import 'package:easysugar/view/screens/update_screen.dart';
import 'package:flutter/material.dart';
import '../../view/screens/patient_home_screen.dart';
import '../../view/screens/settings_screen.dart';
import '../../view/screens/statistics_screen.dart';
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
        return MaterialPageRoute(builder: (_) => FollwarScreen());
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
        return MaterialPageRoute(builder: (_) => const EmergencyPage());
      case RoutsNames.reportScreen:
        return MaterialPageRoute(builder: (_) =>  ReportScreen());
      case RoutsNames.follwarNameScreen:
        return MaterialPageRoute(builder: (_) => const FollwerNameScreen());
      case RoutsNames.statisticsScreen:
        return MaterialPageRoute(builder: (_) =>  const SttisticsScreen());
         case RoutsNames.doctorProfileScreen:
        return MaterialPageRoute(builder: (_) =>   PrfileDoctorScreen());
         case RoutsNames.doctorsettingsScreen:
        return MaterialPageRoute(builder: (_) =>   SettingDoctorScreen());
         case RoutsNames.consultingDoctorScreen:
        return MaterialPageRoute(builder: (_) =>  const ConsultingDoctorScreen());
         case RoutsNames.analysisScreen:
        return MaterialPageRoute(builder: (_) =>  const AnalysisScreen());
         case RoutsNames.medicationsScreen:
        return MaterialPageRoute(builder: (_) =>  const MedicationScreen());
         case RoutsNames.getOfferScreen:
        return MaterialPageRoute(builder: (_) =>  const GetOfferScreen());
         case RoutsNames.updateScreen:
        return MaterialPageRoute(builder: (_) => const UpdateScreen ());
         case RoutsNames.doctorReseervationScreen:
        return MaterialPageRoute(builder: (_) =>  const DoctorReseervationScreen());
        case RoutsNames.contactWhitDoctorScreen:
        return MaterialPageRoute(builder: (_) =>  const ContactWhithDoctorScreen());
    }
    }
    
  }

