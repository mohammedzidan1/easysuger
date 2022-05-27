import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDefaultButton extends StatelessWidget {
  final Function? ontap;
  final String? text;
  final double? height;
  final double? width;
  final double? radius;

  const CustomDefaultButton(
      {Key? key,
      this.text,
      this.radius = 33,
      this.ontap,
      this.height = 60,
      this.width = 290})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color.fromARGB(255, 33, 176, 162),
            //  border: Border.all(color: Colors.grey)
          ),
          child: Center(
            child: CustomText(
              text: text,
              fontSise: 20,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
