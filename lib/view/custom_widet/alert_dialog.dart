import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';

AlertDialog alertDialog(
        {BuildContext? context,
        String? title,
        String? content,
        String? cancelText,
        String? confirmText,
        VoidCallback? onConfirm,
        VoidCallback? onCancel}) =>
    AlertDialog(
      title: Text(
        title ?? '',
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.all(8),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content ?? '',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _raisedButton(
                context: context,
                text: confirmText,
                onPressed: onConfirm,
                color: Colors.red,
              ),
              _raisedButton(
                context: context,
                text: cancelText,
                onPressed: onCancel,
              )
            ],
          )
        ],
      ),
    );

RaisedButton _raisedButton({
  BuildContext? context,
  String? text,
  VoidCallback? onPressed,
  Color? color,
  Color? textColor,
}) =>
    RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: color ?? ColorsApp.primaryColor,
      textColor: textColor ?? Colors.white,
      onPressed: () {
        Navigator.of(context!).pop();
        if (onPressed != null) onPressed();
      },
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
