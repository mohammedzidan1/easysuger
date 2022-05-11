import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String? text;
  final String? imageName;
  final VoidCallback? onPress;

  CustomButtonSocial({
    @required this.text,
    @required this.imageName,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28),
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade200,
      ),
      child: TextButton(
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(imageName!),
            SizedBox(
              width: 50,
            ),
            CustomText(
              text: text,
              color: Colors.black,
              fontSise: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
