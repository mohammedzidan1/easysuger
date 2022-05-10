import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/view/custom_widet/custom_background_curve.dart';
import 'package:easysugar/view/custom_widet/custom_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/cubit/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widet/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthBloc().logOut(context);
              },
            ),
          ],
          backgroundColor: const Color(0xff08877A),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff08877A),
          ),
          title: const CustomText(
            text: "Welcom To Easy Sugar",
            fontSise: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Background(),
                customBuildContainer(context),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: customContainer(
                    context,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomText(
                            text: "30",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          Column(
                            children: const [
                              CustomText(
                                text: "Bol",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 5,),
                              CustomText(
                                text: "Bas",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                           Column(
                            children: const [
                              CustomText(
                                text: "carbs-",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 5,),
                              CustomText(
                                text: "cal-",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                           Column(
                            children: const [
                              CustomText(
                                text: "running",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 5,),
                              CustomText(
                                text: "20m",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.predictionScreen);
                            print("object");
                          },
                          text: "Predict the insukine unit",
                          radiusLeftTop: 25,
                          fontSize: 22.0,
                          radiusButtomRight: 25,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          ontap: () {},
                          text: "Statistics",
                          radiusLeftTop: 25,
                          fontSize: 22.0,
                          radiusButtomRight: 25,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          ontap: () {
                            Navigator.pushNamed(
                                context, RoutsNames.addRecordScreen);
                          },
                          text: "Add record +",
                          radiusLeftTop: 25,
                          radiusButtomRight: 25,
                          fontSize: 22.0,
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
        drawer: const CustomDrawer());
  }
}

Widget customContainer(context, {Widget? child}) => Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 8),
      height: MediaQuery.of(context).size.height * .084,
      width: 300,
      color: const Color(0xffE3F4FF).withOpacity(.7),
      child: child,
    );

Widget customBuildContainer(context) => customContainer(
      context,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomText(
                text: "B G",
                color: Colors.black,
                fontSise: 17,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Insulin",
                color: Colors.black,
                fontSise: 17,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Food ",
                color: Colors.black,
                fontSise: 17,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Activity",
                color: Colors.black,
                fontSise: 17,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SizedBox(
                  height: 30,
                  child: Image(
                    image:
                        AssetImage("assets/images/icons8-glucose-meter-64.png"),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                  height: 30,
                  child: Image(
                    image:
                        AssetImage("assets/images/icons8-insulin-pen-48.png"),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                  height: 30,
                  child: Image(
                    image: AssetImage("assets/images/icons8-broccoli-16.png"),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                  height: 30,
                  child: Image(
                    image: AssetImage("assets/images/icons8-running-16.png"),
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ],
      ),
    );