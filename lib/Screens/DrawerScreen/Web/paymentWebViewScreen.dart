// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../../../Extra/AppTheme.dart';
import '../../../Extra/assets.dart';
import '../../../Extra/config.dart';

class PaymentWebviewScreen extends StatelessWidget {
  PaymentWebviewScreen({
    this.title,
    this.endPoint
  });

  String? title;
  String? endPoint;

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
        title: Text('$title',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: WebViewX(
        initialContent: termBaseurl+'$endPoint',
        initialSourceType: SourceType.url,
        width: double.infinity, 
        height: double.infinity
      )
    );
  }
}