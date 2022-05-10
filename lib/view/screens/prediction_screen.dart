import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_add_prediction.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // var formKey = GlobalKey<FormState>();
  // var activityController = TextEditingController();
  // var lanchController = TextEditingController();
  // var dinnerController = TextEditingController();

  var breakfastController = TextEditingController();

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
                    dateController.text = value.toString();
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
                      timeController.text = value!.toString();

                      print(value.format(context));
                    });
                  },
                  lableText: "Time",
                  assetsImage: "assets/images/icons8-music-time-100.png"),
              CustomAddPrediction(
                onTap: () {
                  // scaffoldKey.currentState!.showBottomSheet(
                  //   (context) => Container(
                  //     color: Colors.white,
                  //     padding: const EdgeInsets.all(
                  //       20.0,
                  //     ),
                  //   ),
                  // );

                 
                },
                assetsImage: "assets/images/icons8-meal-100.png",
                lableText: "Meal",
              ),
              CustomAddPrediction(
                onTap: () {},
                assetsImage: "assets/images/icons8-activity-64.png",
                lableText: "Activity type",
              ),
              CustomAddPrediction(
                onTap: () {
               
                },
                assetsImage: "assets/images/icons8-insulin-pen-48.png",
                lableText: "Glucose measurement",
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer:const CustomDrawer(),
    );
  }
}
