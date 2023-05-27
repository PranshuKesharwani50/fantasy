// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Models/myTeamModel.dart';

// ignore: camel_case_types
class myTeamProvider extends ChangeNotifier{

  myTeamModel? myTeam;
  
  myTeamModel? get teams => myTeam;

  void insert(myTeamModel? data){
    myTeam = data;
    ChangeNotifier();
  }

}