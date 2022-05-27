import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function? ontap;
  final String? text;
  final double? height;
  final double? width;
  final double? radiusLeftTop;
    final double? radiusButtomRight;
final double? fontSize;


  const CustomButton(
      {Key? key,
      this.text,
      this.fontSize,
      this.radiusLeftTop,
            this.radiusButtomRight,

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
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radiusLeftTop!),bottomRight: Radius.circular(radiusButtomRight!)),
            color: const Color.fromARGB(255, 33, 176, 162),
            //  border: Border.all(color: Colors.grey)
          ),
          child: Center(
            child: CustomText(
              text: text,
              fontSise: fontSize,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
