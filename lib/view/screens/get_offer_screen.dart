import '../../help/my_colors_app.dart';
import '../../help/routs/routs_name.dart';
import '../custom_widet/custom_curve.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_background_curve.dart';
import '../custom_widet/custom_text.dart';

class GetOfferScreen extends StatelessWidget {
  const GetOfferScreen({Key? key}) : super(key: key);

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
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Get Offer",
                  color: Colors.black,
                  fontSise: 40,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage('assets/images/icons8-recieve-48.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                buildFollwerNameItem(
                  onTap: (){
                    Navigator.pushNamed(context, RoutsNames.medicationsScreen);
                  },
                    text: "MEDICATION",),
                   // image: "assets/images/icons8-medications-64.png"),
                buildFollwerNameItem(
                    onTap: (){
                      Navigator.pushNamed(context, RoutsNames.analysisScreen);
                    },
    text: "ANALYSES",

    //image: "assets/images/icons8-analysis-32_2.png"),
                )],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFollwerNameItem({required text,required onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: text,
                color: Colors.white,
                fontSise: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 13,
              ),
              // Image(
              //   image: AssetImage(image),
              // ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
