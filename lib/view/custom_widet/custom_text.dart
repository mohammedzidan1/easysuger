import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSise;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      this.text = "",
      this.color = Colors.white,
      this.fontSise,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.clip,
      style:
          TextStyle(color: color!, fontSize: fontSise, fontWeight: fontWeight),
    );
  }
}
