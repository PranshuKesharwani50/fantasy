import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier{

  // int? hour;
  // int? minute;
  // int? secounds;

  int timeLeft = 0;
  bool? timeOut = false;

  int? get time => timeLeft;
  // int? get hr => hour;
  // int? get sec => secounds;

  void insert(int? data){
    timeLeft = data!;
    notifyListeners();
  }

  void update(int? data){
    timeLeft = data!;
    if(timeLeft<=0){
      timeOut = true;
    }
    notifyListeners();
  }

}