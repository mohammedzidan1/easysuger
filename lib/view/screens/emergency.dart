import 'package:easysugar/model/follower.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../help/my_colors_app.dart';
import '../custom_widet/custom_curve.dart';
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
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black.withOpacity(.5),
                )),
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
                      image:
                          AssetImage('assets/images/icons8-emergency-64.png'),
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
                      child: ModelStreamGetBuilder<Follower>(
                          parentModel: Get.put(AuthVeiwModel()).user,
                          onEmpty: () => const CustomText(
                                text: "No follower Yet",
                                color: Colors.black,
                                fontSise: 30,
                                fontWeight: FontWeight.bold,
                              ),
                          onLoading: () => const CircularProgressIndicator(),
                          onSuccess: (followers) {
                            return ListView.builder(
                                itemCount: followers?.length,
                                itemBuilder: ((context, index) {
                                  Follower? follower = followers![index];
                                  return buildEmergencyNameItem(
                                      text: follower?.phoneNum,
                                      onTap: () {
                                        // launch('tel:+91 88888888888');
                                        canLaunchUrl(Uri(
                                            scheme: 'tel',
                                            path: follower?.phoneNum));
                                      });
                                }));
                          }),
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
