import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomAddPrediction extends StatelessWidget {
  const CustomAddPrediction(
      {Key? key,
      this.onTap,
      this.controller,
      this.lableText,
      this.color,
      this.assetsImage,
      this.readOnly = false})
      : super(key: key);
  final String? lableText;
  final Color? color;
  final Function? onTap;
  final bool? readOnly;
  final TextEditingController? controller;

  final String? assetsImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(assetsImage!),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CustomTextField(
                width: MediaQuery.of(context).size.width*.5,
                readOnly: readOnly!,
                onTap: () {
                  onTap!();
                },
                controller: controller,
                color: color,
              //  width: MediaQuery.of(context).size.width*.7,
                lableText: lableText,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14.0,
        ),
      ],
    );
  }
}
