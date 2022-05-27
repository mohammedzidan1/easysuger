
import '../../help/my_colors_app.dart';
import '../custom_widet/custom_default_button.dart';
import '../custom_widet/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_curve.dart';

import '../custom_widet/custom_text.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //     backgroundColor:ColorsApp.primaryColor,
      //     title: ),
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
                    text: "Medication",
                    color: Colors.black,
                    fontSise: 40,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage(
                            'assets/images/icons8-medication-64.png'),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Image(
                        image: AssetImage('assets/images/icons8-pills-48.png'),
                      ),
                    ],
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
                      children: const [
                        CustomText(
                          text: "Medication Code",
                          fontWeight: FontWeight.bold,
                          fontSise: 16,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            width: 150, color: ColorsApp.primaryColor),
                        SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: "User Code",
                          fontWeight: FontWeight.bold,
                          fontSise: 16,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            width: 150, color: ColorsApp.primaryColor),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDefaultButton(
                    width: 100,
                    text: "Show info",
                    ontap: () {
                      showDialog(
                          context: context,
                          // barrierDismissible: false,
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
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      buidDialogItem(
                                          text: "Pharmacy : Elezaby"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      buidDialogItem(
                                          text: "Time : 18:00"),
                                    ],
                                  ),
                                ),
                                shape: const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(130),
                      ),
                                ));
                          });
                    },
                  )
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

