import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? lableText;
  final IconData? prefexIcon;
  final IconData? sufixIcon;
  final double? width;
  final Color? color;
  final bool? readOnly;
  final TextEditingController? controller;
  final Function? onTap;
  final Function? onChanged;
  const CustomTextField(
      {Key? key,
      this.onTap,
      this.onChanged,
      this.controller,
      this.color = const Color.fromARGB(255, 246, 245, 245),
      this.lableText,
      this.prefexIcon,
      this.width = double.infinity,
      this.sufixIcon,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          //  color: const Color.fromARGB(255, 246, 245, 245),
          color: color,
          border: Border.all(color: ColorsApp.primaryColor),

          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 1),
            child: TextFormField(
                onChanged: (s) {
                  onChanged!(s);
                },
                readOnly: readOnly!,
                controller: controller,
                onTap: () {
                  onTap!();
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: lableText,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIconColor: Colors.teal,
                    suffixIcon: Icon(sufixIcon),
                    prefixIcon: Icon(prefexIcon)))));
  }
}