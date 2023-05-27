// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.label,
    required this.widget,
    this.paddingSize,
    this.radiusSize,
    this.font,
    this.letterSpacing,
    this.wordSpacing,
    this.fontWeight,
    this.fontSize,
    this.fontColor
  });

  String? font;
  Color? fontColor;
  double? letterSpacing;
  double? wordSpacing;
  FontWeight? fontWeight;
  double? fontSize;
  String label;
  Widget widget;
  EdgeInsetsGeometry? paddingSize;
  double? radiusSize = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: paddingSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radiusSize!)
        ),
        color: textFieldBg
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              fontFamily: font,
              color: fontColor
            ),
          ),
          widget,
        ],
      )
    );
  }
}