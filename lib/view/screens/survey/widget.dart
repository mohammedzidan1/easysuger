import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:easysugar/view/screens/survey/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Survey survey = Survey();
PageController controller = PageController(initialPage: 0);
survey1() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customTextButton(() {
        Get.put(SurveyController()).survey1 = 'Prediabetic';

        controller.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      }, '1.Prediabetic'),
      customTextButton(() {
        Get.put(SurveyController()).survey1 = 'Tybe-1';
      }, '2.Tybe-1'),
      customTextButton(() {
        Get.put(SurveyController()).survey1 = 'Tybe-2';
      }, '3.Tybe-2'),
      customTextButton(() {
        Get.put(SurveyController()).survey1 = 'gestational diabetes';
      }, '4.gestational diabetes'),
    ],
  );
}

Widget survey2() {
  return UpdateCustomTextField(
    width: 200,
    onChanged: (value) {
      Get.put(SurveyController()).survey2 = value;
      print(Get.put(SurveyController()).survey2);
    },
  );
}

Widget survey3() {
  return UpdateCustomTextField(
    width: 200,
    onChanged: (value) {
      Get.put(SurveyController()).survey3 = value;
    },
  );
}

Widget survey4() {
  return Column(
    children: [
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {
          Get.put(SurveyController()).survey4 = value;
        },
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {
          Get.put(SurveyController()).survey4 = value;
        },
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {
          Get.put(SurveyController()).survey4 = value;
        },
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {
          Get.put(SurveyController()).survey4 = value;
        },
      ),
    ],
  );
}

Widget survey5() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey5 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey5 = 'No';
      }),
    ],
  );
}

Widget survey6() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          YesButton(
            onPress: () {
              Get.put(SurveyController()).survey6 = 'Yes';
            },
          ),
          NoButton(onPress: () {
            Get.put(SurveyController()).survey6 = 'No';
          }),
        ],
      ),
      SomeTimesButton(
        onPress: () {
          Get.put(SurveyController()).survey6 = 'SomeTimes';
        },
      ),
    ],
  );
}

Widget survey7() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey7 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey7 = 'No';
      }),
    ],
  );
}

Widget survey8() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey8 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey8 = 'No';
      }),
    ],
  );
}

Widget survey9() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey9 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey9 = 'No';
      }),
    ],
  );
}

Widget survey10() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey10 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey10 = 'No';
      }),
    ],
  );
}

Widget survey11() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey11 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey11 = 'No';
      }),
    ],
  );
}

Widget survey12() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey12 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey12 = 'No';
      }),
    ],
  );
}

Widget survey13() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          Get.put(SurveyController()).survey13 = 'Yes';
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey13 = 'No';
      }),
    ],
  );
}

Widget survey14() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      YesButton(
        onPress: () {
          print('on');
          Get.put(SurveyController()).survey14 = 'Yes';
          Get.put(SurveyController()).createSurvey();
          print('end');
        },
      ),
      NoButton(onPress: () {
        Get.put(SurveyController()).survey14 = 'No';
        Get.put(SurveyController()).createSurvey();
      }),
    ],
  );
}

customTextButton(onPress, text) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ));
}

class YesButton extends StatelessWidget {
  Function? onPress;

  YesButton({this.onPress});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 80,
        width: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: ColorsApp.primaryColor, width: 3),
        ),
        child: TextButton(
          onPressed: () {
            onPress!();
          },
          child: const Text(
            'Yes',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class NoButton extends StatelessWidget {
  Function? onPress;

  NoButton({this.onPress});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 80,
        width: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: ColorsApp.primaryColor, width: 3),
        ),
        child: TextButton(
          onPressed: () {
            onPress!();
          },
          child: const Text(
            'No',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SomeTimesButton extends StatelessWidget {
  Function? onPress;

  SomeTimesButton({this.onPress});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 80,
        width: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: ColorsApp.primaryColor, width: 3),
        ),
        child: TextButton(
          onPressed: () {
            onPress!();
          },
          child: const Text(
            'SomeTimes',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
