import 'package:flutter/material.dart';

import '../../help/constant.dart';
import '../../help/my_colors_app.dart';

class CustomDrobDownMenuShortAction extends StatefulWidget {
 
    const CustomDrobDownMenuShortAction({ Key? key}) : super(key: key);

  @override
  State<CustomDrobDownMenuShortAction> createState() => _CustomDrobDownMenuShortActionState();
}

class _CustomDrobDownMenuShortActionState extends State<CustomDrobDownMenuShortAction> {
  String selectedItemShortAction = "Actrapid";

 
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width*.6,
      padding: EdgeInsets.all(10.0),
      decoration:  BoxDecoration(
        border: Border.all(color: ColorsApp.primaryColor),
        borderRadius: BorderRadius.circular(10),
        
        
      ),
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
                   ),
    );
  }
}