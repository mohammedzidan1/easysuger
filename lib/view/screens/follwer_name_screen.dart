import '../../help/my_colors_app.dart';
import '../custom_widet/custom_curve.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_text.dart';

class FollwerNameScreen extends StatelessWidget {
  const FollwerNameScreen({Key? key}) : super(key: key);
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
                  text: "FOLLWERS",
                  color: Colors.black,
                  fontSise: 30,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 60,
                ),
                buildFollwerNameItem("Mohmmed Zidane"),
                buildFollwerNameItem("Menaa"),
                buildFollwerNameItem("Basmala")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFollwerNameItem(text) {
  return Column(
    children: [
      Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: ColorsApp.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            fontSise: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
