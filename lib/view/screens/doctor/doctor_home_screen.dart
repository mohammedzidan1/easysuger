import 'package:easysugar/model/doctor.dart';
import 'package:easysugar/view/custom_widet/custom_doctor_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../help/my_colors_app.dart';

class HomeScreenForDoctor extends StatelessWidget {
  const HomeScreenForDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 44, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width,
          child: ModelStreamSingleBuilder<Doctor>(onSuccess: (doctor) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: "Welcome to Easy Sugar",
                      fontSise: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: 100,
                  width: 100,
                  child: doctor?.imageUrl == ''
                      ? Image.asset(' assets/images/unknown-person.jpg')
                      : Image.network(
                          doctor!.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        barrierColor: ColorsApp.primaryColor.withOpacity(.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        context: context,
                        builder: (context) => Container(
                              height: 240,
                              child: Column(
                                children: const [
                                  ListTile(
                                    leading: CustomText(
                                      text: "Ahmed  Mohamed  ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ListTile(
                                    leading: CustomText(
                                      text: " Emad Ahmed ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ListTile(
                                    leading: CustomText(
                                      text: " Mohamed zidan ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ));
                  },
                  child: Container(
                    child: const Center(
                        child: CustomText(
                      text: "Patients Names",
                      fontSise: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff08776B),
                    )),
                    height: 110,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffFBFBFB),
                      // color: Colors.amber,
                      border: Border.all(
                        color: const Color(0xff086F64),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        barrierColor: ColorsApp.primaryColor.withOpacity(.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        context: context,
                        builder: (context) => Container(
                              height: 240,
                              child: Column(
                                children: const [
                                  ListTile(
                                    leading: CustomText(
                                      text: " Monday. at : ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    title: CustomText(
                                        text: "8.00  Pm", color: Colors.black),
                                    trailing: CustomText(
                                        text: "Ahmed Mohamed ",
                                        color: Colors.black),
                                  ),
                                  ListTile(
                                    leading: CustomText(
                                      text: " Friday. at : ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    title: CustomText(
                                        text: "10.00  Am", color: Colors.black),
                                    trailing: CustomText(
                                        text: "Emad Ahmed ",
                                        color: Colors.black),
                                  ),
                                  ListTile(
                                    leading: CustomText(
                                      text: " Saturday. at : ",
                                      color: Colors.black,
                                      fontSise: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    title: CustomText(
                                        text: "12.00  Am", color: Colors.black),
                                    trailing: CustomText(
                                        text: "Mohamed zidan ",
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                        child: CustomText(
                      text: "Patients appointments",
                      fontSise: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    height: 180,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff57A29B),
                      // color: Colors.amber,
                      border: Border.all(
                        color: const Color(0xff086F64),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        drawer: const CustomDoctorDrawer());
  }
}
