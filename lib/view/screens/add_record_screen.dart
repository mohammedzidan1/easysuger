import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_background_curve.dart';
import 'package:easysugar/view/custom_widet/custom_button.dart';
import 'package:easysugar/view/custom_widet/custom_default_button.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_text_field.dart';

class AddRecordScreen extends StatefulWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  String selectedItemShortAction = "Actrapid";

  var shortActionList = [
    "Actrapid",
    "Afrezza",
    "Apidra",
    "Fiasp",
    "Liprolog",
    "Novolin R",
    "NovoRapid",
    "Gensulin R",
    "Humalog",
    "Humulin R",
    "Insuman R",
    "Liprolog ",
    "Novolog",
    "Regular",
    "U-500"
  ];
  String selectedItemLongAction = "Gensulin N";

  var longActionList = [
    "Gensulin N",
    "Humalog Mix75/25",
    "Humlin 70/30",
    "Humulin N",
    "Insulatard ",
    " Insuman N",
    "Lantus ",
    "Levemir",
    "Mixtard 30",
    "Novolin 70/30",
    "Novolog 30/70",
    "Novolog 50/50 ",
    "Novolog 70/30",
    "NovoMix 30",
    "NovoMix 50",
    "NovoMix70",
    "NovoRapid 70/30",
    "NPH",
    "Protaphane",
    "Ryzodeg",
    "Toujeo",
    "Tresiba",
    "Basaglar",
  ];
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
             Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     DropdownButton<String>(
                       value: selectedItemShortAction,
                       items: shortActionList.map((e) {
                         return DropdownMenuItem(value: e, child: Text(e));
                       }).toList(),
                       onChanged: (String? value) {
                         setState(() {
                           selectedItemShortAction = value!;
                         });
                       },
                     ),
                   ],
                 )),
             const SizedBox(
               height: 10.0,
             ),
             Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     DropdownButton<String>(
                       value: selectedItemLongAction,
                       items: longActionList.map((e) {
                         return DropdownMenuItem(value: e, child: Text(e));
                       }).toList(),
                       onChanged: (String? value) {
                         setState(() {
                           selectedItemLongAction = value!;
                         });
                       },
                     ),
                   ],
                 )),
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
