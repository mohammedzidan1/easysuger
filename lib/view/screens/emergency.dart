import 'package:url_launcher/url_launcher.dart';

import '../../help/my_colors_app.dart';
import '../../help/routs/routs_name.dart';
import '../custom_widet/custom_curve.dart';
import 'package:flutter/material.dart';

import '../custom_widet/custom_background_curve.dart';
import '../custom_widet/custom_text.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

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
                icon:  Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(.5),)),
          ),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                 
                  children: [
                    const CustomText(
                      text: "Emerrgency",
                      color: Colors.black,
                      fontSise: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Image(
                      image: AssetImage('assets/images/icons8-emergency-64.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildEmergencyNameItem(
                      text: "122",
                      onTap: () async {
                        await canLaunchUrl(Uri(scheme: 'tel', path: '122'));
                      },
                    ),
                  Expanded(
                    
                    child: ListView.builder(
                        
                        itemCount: 2,
                          itemBuilder: ((context, index) => (buildEmergencyNameItem(
                              text: "01156094458",
                              onTap: ()  {
                                 canLaunchUrl(Uri(scheme: 'tel', path: '01156094458'));
                              })))),
                  )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

Widget buildEmergencyNameItem({required text, required onTap}) {
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
              Container(

                child: const Image(
                  image: AssetImage("assets/images/icons8-callback-16.png"),
                ),
              ),
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

