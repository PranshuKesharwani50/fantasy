import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
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
        initialContent: 'https://playon69.com/terms-and-conditions',
        initialSourceType: SourceType.url,
        width: double.infinity, 
        height: double.infinity
      )
    );
  }
}