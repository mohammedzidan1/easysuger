import 'package:asuka/asuka.dart' as asuka;
import 'package:easysugar/help/constant.dart';
import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/approuts.dart';
import 'package:easysugar/model/follower.dart';
import 'package:easysugar/model/perdictions.dart';
import 'package:easysugar/model/rebort.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/model/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'model/doctor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await box.initStorage;
  await Firebase.initializeApp();

  FirestoreModel.injectAll(
      [UserModel(), Prediction(), Report(), Survey(), Follower(), Doctor()]);
  runApp(MyApp(
    appRouts: AppRouts(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouts? appRouts;
  const MyApp({Key? key, this.appRouts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        tabBarTheme: const TabBarTheme(
            labelColor: ColorsApp.primaryColor,
            labelStyle: TextStyle(color: Colors.black), // color for text
            indicator: UnderlineTabIndicator(
                // color for indicator (underline)
                borderSide: BorderSide(color: ColorsApp.primaryColor))),
      ),
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,

      // getPages: [
      //   GetPage(name: RoutsNames.surveyPage, page: () => SurveyPage())
      // ],
      // initialRoute: RoutsNames.surveyPage,
      onGenerateRoute: appRouts!.genirateRoute,
    );
  }
}
