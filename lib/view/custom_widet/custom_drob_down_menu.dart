import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  var auth = Get.put(AuthVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width ,
      // width: w,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: auth.shortAction,
            items: shortActionList.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                auth.shortAction = value!;
                print('sh ${auth.shortAction}');
                // UserModel userModel = UserModel();
                // userModel.update(
                //     docId: FirebaseAuth.instance.currentUser?.uid,
                //     data: {
                //       "shortAction": selectedItemShortAction,
                //     });
              });
            },
          ),
        ],
      ),
    );
  }
}
