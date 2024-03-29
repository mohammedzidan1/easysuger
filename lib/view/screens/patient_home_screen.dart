import 'package:easysugar/help/constant.dart';
import 'package:easysugar/help/routs/routs_name.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/custom_widet/custom_curve.dart';
import 'package:easysugar/view/custom_widet/custom_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../custom_widet/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthVeiwModel authVeiwModel = Get.put(AuthVeiwModel());
  @override
  void initState() {
    print('init');
    authVeiwModel.getUserData();
    print('end');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(authVeiwModel.user?.toMap);
    return ModelStreamSingleBuilder<UserModel>(
        // parentModel: authVeiwModel.user,
        docId: FirebaseAuth.instance.currentUser?.uid ?? box.read('patientId'),
        onError: (e) => Text('error'),
        onEmpty: () => Text('no result'),
        onSuccess: (user) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
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
                      CustomBackground(),
                      customBuildContainer(context),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: customContainer(context,
                            child: user?.date != ''
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: user?.glucose,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              text: user?.longAction,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                              text: user?.shortAction,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Flexible(
                                                child: CustomText(
                                                  text: user?.lunch,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: .9,
                                              ),
                                              Flexible(
                                                child: CustomText(
                                                  text: user?.carbs,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: .9,
                                              ),
                                              Flexible(
                                                child: CustomText(
                                                  text: user?.cal,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              text: user?.activityType,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                              text: "${user?.duration} m",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                      'No Prediction Yet !',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )),
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
                                ontap: () {
                                  Navigator.pushNamed(
                                      context, RoutsNames.statisticsScreen);
                                },
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
        });
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
