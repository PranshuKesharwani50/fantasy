// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:playon69/Models/availableTeamModel.dart';

class NewContestStatusProvider extends ChangeNotifier{

  AvailableTeamModel? availableTeams;

  AvailableTeamModel? get teams => availableTeams;

  void insert(AvailableTeamModel data){
    availableTeams = data;
    notifyListeners();
  }

}