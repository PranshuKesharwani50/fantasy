// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playon69/apis/sharedPreference.dart';
import 'package:webviewx/webviewx.dart';

import '../../../Extra/config.dart';

class GameWebViewScreen extends StatefulWidget {
  GameWebViewScreen({
    this.token,
    this.gameType
  });

  String? token;
  int? gameType;

  @override
  State<GameWebViewScreen> createState() => _GameWebViewScreenState();
}

class _GameWebViewScreenState extends State<GameWebViewScreen> {

  String? token;

  getUser() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    token = res['token'];
    print(token);
  }

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: WebViewX(
          initialContent: termBaseurl+'ludo/?user_id=$token&gametype=${widget.gameType}',
          width: double.infinity, 
          height: double.infinity
        ),
      ),
    );
  }
}