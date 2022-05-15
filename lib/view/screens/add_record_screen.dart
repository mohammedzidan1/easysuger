import 'package:easy_localization/easy_localization.dart';
import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/view/custom_widet/custom_default_button.dart';
import 'package:easysugar/view/custom_widet/custom_drob_menue_long_action.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../view_model/auth/cubit/auth_bloc.dart';
import '../custom_widet/custom_drob_down_menu.dart';

class AddRecordScreen extends StatefulWidget {
  AddRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  String selectedItemPills = "Metformin Tablets";
  List<String> pillsList = [
    "Metformin Tablets",
    "Omformin",
    "Glucophage 100 mg",
    "other"
  ];

  var timeController = TextEditingController();
  var otheController = TextEditingController();

  var dateController = TextEditingController();

  var fastingController = TextEditingController();

  var reminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: const CustomText(
          text: "Add Record",
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, RoutsNames.homeScreenForPatient);
        //       },
        //       icon: const Icon(Icons.home))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
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
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
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
                      timeController.text =
                          value!.format(context).split('/').first.toString();
                    });
                  },
                  // color: Colors.grey[400],
                  width: 100,
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    controller: timeController,
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
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomDrobDownMenuShortAction(),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: "Short Action",
                      color: Colors.black,
                      fontSise: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomDrobDownMenuLongAction(),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "Long Action",
                    color: Colors.black,
                    fontSise: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            buildFormFeild(context,
                text: "Fasting", controller: fastingController),
            const SizedBox(
              height: 18.0,
            ),
            buildFormFeild(context,
                text: "Reminder", controller: fastingController),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsApp.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedItemPills,
                      items: pillsList.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedItemPills = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  const CustomText(
                    text: "Pills",
                    color: Colors.black,
                    fontSise: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            selectedItemPills == "other"
                ? buildFormFeild(context,
                    text: "Other", controller: otheController)
                : Container()
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.primaryColor,
       
        onPressed: () {
          AuthBloc().createReport(
              dateController.text,
              timeController.text,
              fastingController.text,
              reminderController.text,
              otheController.text == ''
                  ? selectedItemPills
                  : otheController.text);
        },

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

Widget buildFormFeild(context,
    {String? text, TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextField(
          controller: controller,
          width: MediaQuery.of(context).size.width * .5,
          color: Colors.white12,
          lableText: text,
        ),
      ],
    ),
  );
}
