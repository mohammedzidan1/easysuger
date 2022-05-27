import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../help/my_colors_app.dart';
import '../../model/follower.dart';
import '../../view_model/auth/auth_veiw_model.dart';
import '../custom_widet/custom_curve.dart';
import '../custom_widet/custom_text.dart';

class FollwerNameScreen extends StatefulWidget {
  const FollwerNameScreen({Key? key}) : super(key: key);

  @override
  State<FollwerNameScreen> createState() => _FollwerNameScreenState();
}

class _FollwerNameScreenState extends State<FollwerNameScreen> {
  @override
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
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.black.withOpacity(.5))),
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: ModelStreamGetBuilder<Follower>(
                  parentModel: Get.put(AuthVeiwModel()).user,
                  onEmpty: () => const CustomText(
                        text: "No follower Yet",
                        color: Colors.black,
                        fontSise: 30,
                        fontWeight: FontWeight.bold,
                      ),
                  onSuccess: (followers) {
                    print('user ${Get.put(AuthVeiwModel()).user?.toMap}');
                    return Container(
                      height: 500,
                      child: ListView.builder(
                          itemCount: followers?.length,
                          itemBuilder: (context, index) {
                            Follower? follower = followers![index];
                            print('follower ${follower}');
                            return Column(
                              children: [
                                if (index == 0)
                                  const CustomText(
                                    text: "FOLLWERS",
                                    color: Colors.black,
                                    fontSise: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                SizedBox(
                                  height: 10,
                                ),
                                buildFollwerNameItem(follower?.name),
                              ],
                            );
                          }),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFollwerNameItem(text) {
  return Column(
    children: [
      Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: ColorsApp.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            fontSise: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
