import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/view/custom_widet/custom_curve.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/screens/survey/widget.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatelessWidget {
  List<String> survey = [
    'Your Type ?',
    '1.weight ?',
    '2.height ?',
    '3.Previous Diseases',
    '4.extreme thirst',
    '5.feeling very hungry',
    '6.Unexplained weight loss',
    '7.frequent urination',
    '8.fatigue',
    '9.blurred vision',
    '10.ease of arousal',
    '11.Sores are slow to heal',
    '12.Presence of ketones in urine',
    '13.recurrent infections',
  ];

  List<Widget> surveyWidget = [
    survey1(),
    survey2(),
    survey3(),
    survey4(),
    survey5(),
    survey6(),
    survey7(),
    survey8(),
    survey9(),
    survey10(),
    survey11(),
    survey12(),
    survey13(),
    survey14(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: PageView.builder(
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 14,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    CustomBackground(),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Survey',
                            color: Colors.grey[700],
                            fontSise: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            '  ${survey[index]}   ',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              backgroundColor: ColorsApp.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: ColorsApp.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: surveyWidget[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
