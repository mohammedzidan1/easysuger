import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

import 'custom_widet/custom_default_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
//lkjhgfdfghjklllllllllllllllll
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
                  Navigator.pushNamed(
                      context, RoutsNames.tapBarForRegestrationScreen,
                      arguments: 1);
                },
                text: "Patient",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(
                text: "Doctor",
                ontap: () {
                  Navigator.pushNamed(
                      context, RoutsNames.tapBarForRegestrationScreen,
                      arguments: 2);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(
                text: "Follwar",
                ontap: () {
                  Navigator.pushNamed(context, RoutsNames.follwarScreen);
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
