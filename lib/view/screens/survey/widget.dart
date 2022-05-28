import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';
import 'package:easysugar/view/screens/survey/controller.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Survey survey = Survey();
PageController controller = PageController();
survey1() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customTextButton(() {
        // survey.survey1 = 'Prediabetic';
        Get.put(SurveyController()).survey1 = '1235676';

        Get.put(SurveyController()).createSurvey();
      }, '1.Prediabetic'),
      customTextButton(() {
        survey.survey1 = 'Tybe-1';
        Get.put(AuthVeiwModel()).createSurvey(survey: survey);
      }, '2.Tybe-1'),
      customTextButton(() {
        survey.survey1 = 'Tybe-2';
        Get.put(AuthVeiwModel()).createSurvey(survey: survey);
      }, '3.Tybe-2'),
      customTextButton(() {
        survey.survey1 = 'gestational diabetes';
        Get.put(AuthVeiwModel()).createSurvey(survey: survey);
      }, '4.gestational diabetes'),
    ],
  );
}

Widget survey2() {
  return UpdateCustomTextField(
    width: 200,
    onChanged: (value) {
      // survey.survey2 = value;
      // survey.save(setOptions: SetOptions(merge: true));
      survey.update(data: {
        'survey2': value,
      });
    },
  );
}

Widget survey3() {
  return UpdateCustomTextField(
    width: 200,
    onChanged: (value) {},
  );
}

Widget survey4() {
  return Column(
    children: [
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {},
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {},
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {},
      ),
      SizedBox(height: 10),
      UpdateCustomTextField(
        width: 200,
        onChanged: (value) {},
      ),
    ],
  );
}

Widget survey5() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey6() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          yesButton(() {}),
          noButton(() {}),
        ],
      ),
      someTimeButton(() {}),
    ],
  );
}

Widget survey7() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey8() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey9() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey10() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey11() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey12() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey13() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}

Widget survey14() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      yesButton(() {}),
      noButton(() {}),
    ],
  );
}
// class CustomTextButton extends StatelessWidget {
//   const CustomTextButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return   TextButton(onPressed: onPress, child: Text(text));
//
//   }
// }

customTextButton(onPress, text) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ));
}

yesButton(onPress) {
  return Container(
    height: 80,
    width: 120,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: ColorsApp.primaryColor, width: 3),
    ),
    child: TextButton(
      onPressed: onPress,
      child: const Text(
        'Yes',
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

noButton(onPress) {
  return Container(
      height: 80,
      width: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: ColorsApp.primaryColor, width: 3),
      ),
      child: TextButton(
          onPressed: onPress,
          child: const Text(
            'No',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          )));
}

someTimeButton(onPress) {
  return Container(
      height: 80,
      width: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: ColorsApp.primaryColor, width: 3),
      ),
      child: TextButton(
          onPressed: onPress,
          child: const Text(
            'Some Times',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          )));
}
