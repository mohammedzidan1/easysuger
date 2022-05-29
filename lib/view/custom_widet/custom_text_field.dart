import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? lableText;
  final TextInputType? keyBordType;
  final IconData? prefexIcon;
  final IconData? sufixIcon;
  final double? width;
  final Color? color;
  final bool? readOnly;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? onTap;
  final Function? onTapS;

  final ValueChanged<String>? onChanged;
  const CustomTextField(
      {Key? key,
      this.keyBordType = TextInputType.name,
      this.onTap,
      this.obscureText = false,
      this.onTapS,
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
                obscureText: obscureText!,
                keyboardType: keyBordType,
                onChanged: onChanged,
                readOnly: readOnly!,
                controller: controller,
                onTap: () {
                  onTap;
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: lableText,
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIconColor: Colors.teal,
                    suffixIcon: InkWell(
                        onTap: () {
                          onTapS!();
                        },
                        child: Icon(sufixIcon)),
                    prefixIcon: Icon(prefexIcon)))));
  }
}

class UpdateCustomTextField extends StatelessWidget {
  final String? lableText;
  final String? initValue;
  final IconData? prefexIcon;
  final IconData? sufixIcon;
  final double? width;
  final Color? color;
  final bool? readOnly;

  final Function? onTap;

  final ValueChanged<String>? onChanged;
  const UpdateCustomTextField(
      {Key? key,
      this.onTap,
      this.initValue = '',
      this.onChanged,
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
                onChanged: onChanged,
                initialValue: initValue!,
                readOnly: readOnly!,
                // onTap: () {
                //   onTap!();
                // },
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
