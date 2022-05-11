import 'package:easy_localization/easy_localization.dart';
import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_drob_down_menu.dart';
import 'package:easysugar/view/custom_widet/custom_drob_menue_long_action.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_add_prediction.dart';

// ignore: must_be_immutable
class PredictionScreen extends StatefulWidget {
  PredictionScreen({Key? key}) : super(key: key);
// test
  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

//hiiiiiiiiiiiiiiii
//lllllllllllll
class _PredictionScreenState extends State<PredictionScreen> {
  String selectedItemTypeOfFood = "lunch";
  List<String> typeOfFoodList = ["lunch", "dinner", "breakfast"];
  var mealController = TextEditingController();

  var activityController = TextEditingController();
  var durationControllar = TextEditingController();

  var glucoseController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: ColorsApp.primaryColor,
          title: const CustomText(
            text: "Prediction",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutsNames.homeScreenForPatient);
                },
                icon: const Icon(Icons.home))
          ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: SingleChildScrollView(
            child: Column(children: [
              CustomAddPrediction(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2030-10-03'),
                  ).then((value) {
                    dateController.text = DateFormat.yMMMd().format(value!);
                  });
                  print("object");
                },
                lableText: "Date",
                controller: dateController,
                assetsImage: "assets/images/icons8-date-64.png",
                // color: ColorsApp.primaryColor,
              ),
              CustomAddPrediction(
                  readOnly: true,
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      timeController.text =
                          value!.format(context).split('/').first.toString();

                      print(value.format(context));
                    });
                  },
                  lableText: "Time",
                  controller: timeController,
                  assetsImage: "assets/images/icons8-music-time-100.png"),
              DropdownButton<String>(
                value: selectedItemTypeOfFood,
                items: typeOfFoodList.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedItemTypeOfFood = value!;
                  });
                },
              ),
              CustomAddPrediction(
                onTap: () {},
                controller: mealController,
                assetsImage: "assets/images/icons8-meal-100.png",
                lableText: "Meal",
              ),
              CustomAddPrediction(
                onTap: () {},
                controller: activityController,
                assetsImage: "assets/images/icons8-activity-64.png",
                lableText: "Activity type",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                controller: durationControllar,
                lableText: "duration ?",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomAddPrediction(
                onTap: () {},
                controller: glucoseController,
                assetsImage: "assets/images/icons8-insulin-pen-48.png",
                lableText: "Glucose measurement",
              ),
              Row(
                children: const [
                  CustomText(
                    text: "Short Action",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(child: CustomDrobDownMenuShortAction()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  CustomText(
                      text: "Long Action",
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(child: CustomDrobDownMenuLongAction()),
                ],
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.primaryColor,
        onPressed: () {
          UserModel userModel = UserModel(
            date: dateController.text,
            time: timeController.text,
            lunch: selectedItemTypeOfFood,
            meal: mealController.text,
            activityType: activityController.text,
            duration: durationControllar.text,
            glucose: glucoseController.text,
          );
          userModel.update(
            data: {
              "time": timeController.text,
              "date": dateController.text,
              "activityType": activityController.text,
              "duration": durationControllar.text,
              "glucose": glucoseController.text,
              // "longAction": longAction,
              "lunch": selectedItemTypeOfFood,
              "meal": mealController.text,
              // "shortAction": shortAction,
            },
            docId: FirebaseAuth.instance.currentUser?.uid,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const CustomDrawer(),
    );
  }
}
