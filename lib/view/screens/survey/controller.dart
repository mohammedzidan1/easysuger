import 'package:easysugar/help/constant.dart';
import 'package:easysugar/model/survey.dart';
import 'package:easysugar/model/users.dart';
import 'package:easysugar/view/screens/patient_home_screen.dart';
import 'package:easysugar/view_model/auth/auth_veiw_model.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  UserModel? user = Get.put(AuthVeiwModel()).user;
  String? survey1 = '';
  String? survey2 = '';
  String? survey3 = '';
  String? survey4 = '';
  String? survey5 = '';
  String? survey6 = '';
  String? survey7 = '';
  String? survey8 = '';
  String? survey9 = '';
  String? survey10 = '';
  String? survey11 = '';
  String? survey12 = '';
  String? survey13 = '';
  String? survey14 = '';

  void createSurvey() async {
    if (box.read('SurveyState') == 'Complete') {}
    Survey? survey = user?.subCollection<Survey>();
    survey?.survey1 = survey1!;
    survey?.survey3 = survey3!;
    survey?.survey2 = survey2!;
    survey?.survey4 = survey4!;
    survey?.survey5 = survey5!;
    survey?.survey6 = survey6!;
    survey?.survey7 = survey7!;
    survey?.survey8 = survey8!;
    survey?.survey9 = survey9!;
    survey?.survey10 = survey10!;
    survey?.survey11 = survey11!;
    survey?.survey12 = survey12!;
    survey?.survey13 = survey13!;
    survey?.survey14 = survey14!;
    await survey?.create(docId: Get.put(AuthVeiwModel()).user?.docId);
    box.write('SurveyState', 'Complete');
    Get.to(() => const HomeScreen());
  }
}
