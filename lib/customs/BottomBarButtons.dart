// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarButton extends StatelessWidget {
  BottomBarButton({
    required this.icon,
    this.iconsize,
    this.color,
    required this.buttonLabel,
    this.fontsize,
    this.onTap,
    this.selectedColor,
    this.fontstyle,
    this.fontweight,
    this.fontFamily,
    this.selected,
    this.space,
  });

  //IconData icon;
  String? icon;
  double? iconsize;
  double? fontsize;
  String buttonLabel;
  Color? color;
  Color? selectedColor;
  FontStyle? fontstyle;
  FontWeight? fontweight;
  String? fontFamily;
  Function()? onTap;
  bool? selected;
  double? space;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      //height: 60, 
      margin: EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      color: selectedColor,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon!,
                color: color,
                height: iconsize
              ),
              SizedBox(height: space,),
              Text('$buttonLabel',
                style: TextStyle(
                  color: color,
                  fontFamily: fontFamily,
                  fontSize: fontsize,
                  fontStyle: fontstyle,
                  fontWeight: fontweight
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}