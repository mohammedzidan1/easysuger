import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/view/custom_widet/custom_button.dart';
import 'package:easysugar/view/screens/survey/Survey.page.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: const Text("update"),
      ),
      body: ModelStreamSingleBuilder<Survey>(
          parentModel: Get.put(AuthVeiwModel()).user,
          onSuccess: (survey) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  customListTile(title: 'YourType', trailing: survey?.survey1),
                  customListTile(title: 'weight', trailing: survey?.survey2),
                  customListTile(title: 'height', trailing: survey?.survey3),
                  customListTile(
                      title: 'Previous Diseases', trailing: survey?.survey4),
                  customListTile(
                      title: 'extreme thirst', trailing: survey?.survey5),
                  customListTile(
                      title: 'feeling very hungry', trailing: survey?.survey6),
                  customListTile(
                      title: 'unexplaiend weight loss',
                      trailing: survey?.survey7),
                  customListTile(
                      title: 'frequent urination', trailing: survey?.survey8),
                  customListTile(title: 'fatigue', trailing: survey?.survey9),
                  customListTile(
                      title: 'blurred vision', trailing: survey?.survey10),
                  customListTile(
                      title: 'ease of arousal', trailing: survey?.survey11),
                  customListTile(
                      title: 'sores are slow to heal',
                      trailing: survey?.survey12),
                  customListTile(
                      title: 'Presence of ketones in urine',
                      trailing: survey?.survey13),
                  customListTile(
                      title: 'recurrent infections',
                      trailing: survey?.survey14),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    fontSize: 24,
                    radiusButtomRight: 10,
                    radiusLeftTop: 10,
                    text: 'Update',
                    ontap: () {
                      Get.to(() => SurveyPage());
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget customListTile({String? title, trailing}) {
    return ListTile(
      title: Text(
        title!,
        style: GoogleFonts.cairo(
          color: ColorsApp.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: GoogleFonts.cairo(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
