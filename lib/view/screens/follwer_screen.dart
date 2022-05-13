
import 'package:flutter/material.dart';

import '../custom_widet/custom_button.dart';
import '../custom_widet/custom_text.dart';



class FollwerScreen extends StatelessWidget {
  const FollwerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //     backgroundColor: ColorsApp.appBarColor,
      //     title: const CustomText(
      //       text: "Welcome To Deaf and Dumb ",
      //     )),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
             decoration: const BoxDecoration(
                     // color:ColorsApp.appBarColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45))),
                          child: const Center(
                            child: CustomText(
                              fontSise: 25,
                              fontWeight: FontWeight.bold,
          text: "Welcome To Deaf and Dumb ",
        ),
                          ),
          ),
          const SizedBox(height: 40,),
          CustomButton(
            ontap: () {
              // Navigator.pushNamed(
              //     context, RoutsNames.main,
              //     arguments: 1);
            },
            text: "Patient",
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            text: "Doctor",
            ontap: () {
              // Navigator.pushNamed(
              //     context, RoutsNames.main,
              //     );
            },
          ),
          const SizedBox(
            height: 25,
          ),
         
        ],
      ),
    );
  }
}