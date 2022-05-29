import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  var auth = Get.put(AuthVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: auth.longAction ?? selectedItemLongAction,
            items: longActionList.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                auth.longAction = value!;
                // UserModel userModel = UserModel();
                // userModel.update(
                //     docId: FirebaseAuth.instance.currentUser?.uid,
                //     data: {
                //       "longAction": selectedItemLongAction,
                //     });
              });
            },
          ),
        ],
      ),
    );
  }
}
