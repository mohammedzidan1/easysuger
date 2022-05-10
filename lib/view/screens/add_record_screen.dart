import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_background_curve.dart';
import 'package:easysugar/view/custom_widet/custom_button.dart';
import 'package:easysugar/view/custom_widet/custom_default_button.dart';
import 'package:easysugar/view/custom_widet/custom_drob_menue_long_action.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_drob_down_menu.dart';
import '../custom_widet/custom_text_field.dart';

class AddRecordScreen extends StatelessWidget {
  AddRecordScreen({Key? key}) : super(key: key);

  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: const CustomText(
          text: "Add Record",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutsNames.homeScreenForPatient);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Column(children: [
        //CustomTextField(width: 100,),
        Row(
          children: [
            CustomDefaultButton(
              height: 50,
              text: "Date",
              ontap: () {
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
              // color: Colors.grey[400],
              width: 100,
            ),
            Container(
              width: 100,
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(

                    //label:Text("kkkk"),

                    hintText: ""),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            CustomDefaultButton(
              height: 50,
              text: "Time",
              ontap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  timeController.text = value!.minute.toString();

                  print(value.format(context));
                });
              },
              // color: Colors.grey[400],
              width: 100,
            ),
            Container(
              width: 100,
              child: TextFormField(
                onTap: () {},
                decoration: const InputDecoration(

                    //label:Text("kkkk"),

                    hintText: ""),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CustomDrobDownMenuShortAction()),
        const SizedBox(
          height: 10.0,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CustomDrobDownMenuLongAction(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
