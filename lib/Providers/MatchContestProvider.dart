// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../Models/MatchContest.dart';

class matchContestProvider extends ChangeNotifier{

  MatchContest? matchdata;

  MatchContest? get matchInfo => matchdata;

  void insert(MatchContest? data){
    matchdata = data;
    notifyListeners();
  }

}