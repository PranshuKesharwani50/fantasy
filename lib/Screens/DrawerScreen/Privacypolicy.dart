// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
        title: Text('Privacy Policy',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: WebViewX(
        initialContent: 'https://playon69.com/privacy-policy',
        initialSourceType: SourceType.url,
        width: double.infinity, 
        height: double.infinity
      )
    );
  }
}