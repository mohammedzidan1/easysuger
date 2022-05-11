import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../help/constant.dart';

class CustomDrobDownMenuLongAction extends StatefulWidget {
  const CustomDrobDownMenuLongAction({Key? key}) : super(key: key);

  @override
  State<CustomDrobDownMenuLongAction> createState() =>
      _CustomDrobDownMenuLongActionState();
}

class _CustomDrobDownMenuLongActionState
    extends State<CustomDrobDownMenuLongAction> {
  String selectedItemLongAction = "Gensulin N";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
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
                UserModel userModel = UserModel();
                userModel.update(
                    docId: FirebaseAuth.instance.currentUser?.uid,
                    data: {
                      "longAction": selectedItemLongAction,
                    });
              });
            },
          ),
        ],
      ),
    );
  }
}
