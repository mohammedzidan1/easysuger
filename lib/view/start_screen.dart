import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../help/constant.dart';
import 'custom_widet/custom_default_button.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  final AuthVeiwModel authVeiwModel = Get.put(AuthVeiwModel());
//lkjhgfdfghjkl7777777777777777777777777
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsApp.primaryColor,
          title: const CustomText(
            text: "Welcome To Easy Sugar",
          )),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDefaultButton(
                ontap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutsNames.tapBarForRegestrationScreen,
                      arguments: 1);

                  authVeiwModel.enterTypeOfUser('Patient');
                },
                text: "Patient",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(
                text: "Doctor",
                ontap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutsNames.tapBarForRegestrationScreen,
                      arguments: 2);
                  authVeiwModel.enterTypeOfUser('Doctor');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(
                text: "Follower",
                ontap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutsNames.follwarScreen);
                  authVeiwModel.enterTypeOfUser('Follower');
                  box.write('patientId', '');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//        Column(
//         children: [
//           Stack(
//             children: [
//                Opacity(
//                  opacity: 0.4,
//                  child: ClipPath(
//                              child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200,
//                   color: Colors.red,
//                              ),
//                              clipper: CustomClipPath(),
//                            ),
//                ),
//             ClipPath(

//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 180,
//                 color: Colors.red,
//               ),
//               clipper: CustomClipPath(),
//             ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// class CustomClipPath extends CustomClipper<Path> {
//   var radius=5.0;
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 9, size.height);
//     path.lineTo(size.width, 0.7);
//     return path;
//   }
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }
