

import '../../help/my_colors_app.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_text_field.dart';

import '../custom_widet/custom_curve.dart';

import '../custom_widet/custom_text.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(.5))),
          ),
          Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Analysis",
                    color: Colors.teal,
                    fontSise: 40,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 180,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xff08877A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(130),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const CustomText(
                          text: "Test Code",
                          fontWeight: FontWeight.bold,
                          fontSise: 16,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomTextField(
                            width: 150, color: ColorsApp.primaryColor),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomText(
                          text: "User Code",
                          fontWeight: FontWeight.bold,
                          fontSise: 16,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomTextField(
                                  width: 150, color: ColorsApp.primaryColor),
                                  IconButton(onPressed: (){
                                    showDialog(
                          context: context,
                           barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 7, 82, 74),
                                title: const Center(
                                    child: Text(
                                  "Info",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )),
                                content: SizedBox(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      buidDialogItem(
                                          text: "Lab Code"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      buidDialogItem(text: "Time : 8:00"),
                                    ],
                                  ),
                                ),
                                actions:  [

                                  InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: const CustomText(text: "Done",fontWeight: FontWeight.bold,))
                                ],
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    topRight: Radius.circular(130),
                                  ),
                                ));
                          });
                                  }, 
                                  icon: const Icon(Icons.forward),color: Colors.white,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 
                ]),
          ),
        ],
      ),
    );
  }
}

Widget buidDialogItem({required text}) {
  return Container(
    child: Center(
        child: CustomText(
      text: text,
      fontSise: 16,
    )),
    width: 200,
    height: 50,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 34, 141, 130),
        borderRadius: BorderRadius.circular(30)),
  );
}



// import 'package:easysugar/help/my_colors_app.dart';
// import 'package:flutter/material.dart';

// class AnalysisScreen extends StatelessWidget {
//   const AnalysisScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorsApp.primaryColor,

//         title: const Text("Analisising"),
//       ),
//     );
//   }
// }