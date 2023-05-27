// ignore_for_file: implementation_imports, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_declarations, non_constant_identifier_names, unnecessary_string_interpolations, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Extra/AppTheme.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({
    required this.startingTime,
    required this.mydurStart,
    required this.mydurEnd
  });

  String startingTime;
  int mydurStart = 10;
  int mydurEnd = 0;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  Timer? countdownTimer;

  var dur;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  // var provider = Provider.of<LiveWithdrawalProvider>;

  var seconds = 0;

  void startTime(){

    DateTime dateTime = DateFormat('hh:mm a').parse(widget.startingTime);
    DateTime dt2 = DateTime.now();
    Duration ddd = dateTime.difference(dt2);

  // if(ddd.inHours < -468023){
  //   dur = ddd.inMilliseconds;
  // }else{
    dur = ddd.inMilliseconds ~/ 1000;
  // }
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) { 
      seconds = dur - 1;
      dur = seconds;
      setState(() {});
    });
  }
  

  @override
  void dispose() {
    countdownTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var tm = Provider.of<TimerProvider>(context).time;
    return Text(
      // '${DateFormat('HH:mm:ss').format(DateTime(0,0,0).add(Duration(seconds: tm!)))}',
      '${DateFormat('hh:mm:ss').format(DateTime(0,0,0).add(Duration(seconds: seconds)))}',
      style: TextStyle(
        fontFamily: font,
        fontSize: 12
      ),
    );
  }
}