import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';

class ContactWhithDoctorScreen extends StatelessWidget {
  const ContactWhithDoctorScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,

        title: const Text("ContactWhithDoctorScreen"),
      ),
    );
  }
}