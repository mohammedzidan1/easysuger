import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../view_model/auth/cubit/auth_bloc.dart';

class HomeScreenForDoctor extends StatelessWidget {
  const HomeScreenForDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthBloc().logOut(context);
            },
          ),
        ],
       systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
        elevation: 0.0,
        toolbarHeight: 75,
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: CustomText(
        //       color: Color(0xff4D8D6E),
        //       text: """      Easy 
        //    Sugar""",
        //       fontSise: 25.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ],
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
        child: Column(
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
              height: 10.0,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/icons8-meal-100.png",
              ),
              radius: 100,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
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
            const SizedBox(
              height: 17.0,
            ),
            Container(
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
          ],
        ),
      ),
      drawer: const Drawer(
          // backgroundColor: Colors.amber,

          ),
    );
  }
}
