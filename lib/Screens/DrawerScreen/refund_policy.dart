// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:webviewx/webviewx.dart';

import '../../Extra/assets.dart';
class refund extends StatefulWidget {
  const refund({super.key});

  @override
  State<refund> createState() => _refundState();
}

class _refundState extends State<refund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -4,
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Text('Refund Policy',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: WebViewX(
        initialContent: 'https://playon69.com/refund-cancellation',
        initialSourceType: SourceType.url,
        width: double.infinity, 
        height: double.infinity
      )
    );
  }
}
