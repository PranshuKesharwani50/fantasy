// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../../../Extra/AppTheme.dart';
import '../../../Extra/assets.dart';

class SupportWebView extends StatelessWidget {
  SupportWebView({
    this.title,
    this.url
  });

  String? title;
  String? url;

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
        initialContent: url!,
        initialSourceType: SourceType.url,
        width: double.infinity, 
        height: double.infinity
      )
    );
  }
}