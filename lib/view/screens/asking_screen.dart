import '../../help/routs/routs_name.dart';
import '../custom_widet/custom_curve.dart';
import 'package:flutter/material.dart';
import '../custom_widet/custom_text.dart';
class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);

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
                icon:  Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(.7),)),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CustomText(
                  text: "Asking",
                  color: Colors.black.withOpacity(.7),
                  fontSise: 40,
                  fontWeight: FontWeight.w600,
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Image(
                //   image: AssetImage('assets/images/icons8-recieve-48.png'),
                // ),
                const SizedBox(
                  height: 60,
                ),
                buildFollwerNameItem(
                  onTap: (){
                    Navigator.pushNamed(context, RoutsNames.contactWhitCommunityScreen);
                  },
                    text: "Community",
                ),
                buildFollwerNameItem(
                    onTap: (){
                     Navigator.pushNamed(context, RoutsNames.contactWhitDoctorScreen);
                    },
                    text: "Dooctor",),
                   
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildFollwerNameItem({required text, required onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: 70,
          width: 300,
          decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(35),
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(10),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: text,
                color: Colors.white,
                fontSise: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 13,
              ),
           
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ],
  );
}
