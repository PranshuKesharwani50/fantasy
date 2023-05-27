// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.label,
    required this.padding,
    required this.borderRadius,
    required this.widget,
    required this.mainAlignment,
    this.width,
    this.height,
    this.color,
    this.fontColor,
    this.fontFamily,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.alignment,
    required this.onTap,
    required this.borderColor,
    required this.borderWidth,
  });

  Alignment? alignment;
  MainAxisAlignment mainAlignment;
  Function()? onTap;
  Widget widget;
  String? label;
  EdgeInsetsGeometry padding;
  double borderRadius;
  double? width;
  double? height;
  Color? color;
  Color? fontColor;
  String? fontFamily;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? borderWidth;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: alignment,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius)
          ),
          border: Border.all(
            width: borderWidth!,
            color: borderColor!,
          ),
          color: color
        ),
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: mainAlignment,
          children: [
            widget,
            SizedBox(width: 5),
            Text(
              '$label',
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
                color: fontColor
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}