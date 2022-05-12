import 'package:easysugar/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../help/constant.dart';
import '../../help/my_colors_app.dart';

class CustomDrobDownMenuShortAction extends StatefulWidget {
  const CustomDrobDownMenuShortAction({Key? key}) : super(key: key);

  @override
  State<CustomDrobDownMenuShortAction> createState() =>
      _CustomDrobDownMenuShortActionState();
}

class _CustomDrobDownMenuShortActionState
    extends State<CustomDrobDownMenuShortAction> {
  String selectedItemShortAction = "Actrapid";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: selectedItemShortAction,
            items: shortActionList.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedItemShortAction = value!;
                UserModel userModel = UserModel();
                userModel.update(
                    docId: FirebaseAuth.instance.currentUser?.uid,
                    data: {
                      "shortAction": selectedItemShortAction,
                    });
              });
            },
          ),
        ],
      ),
    );
  }
}
