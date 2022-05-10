import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/approuts.dart';
import 'package:easysugar/model/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirestoreModel.injectAll([
    UserModel(),
  ]);
  runApp(MyApp(
    appRouts: AppRouts(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouts? appRouts;
  const MyApp({Key? key, this.appRouts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      onGenerateRoute: appRouts!.genirateRoute,
    );
  }
}
