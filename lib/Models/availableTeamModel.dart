import 'package:playon69/Models/myTeamModel.dart';

class AvailableTeamModel{

  String? message;
  bool? status;
  int? code;
  int? action;
  List<TeamList>? teamList;

  AvailableTeamModel({
    this.code,
    this.message,
    this.action,
    this.status,
    this.teamList
  });

  AvailableTeamModel.fomJson(var json){
    code = json['code'];
    message = json['message'];
    action = json['action'];
    status = json['status'];
    if(json['team_list']!=null){
      final data = List<Map<String , dynamic>>.from(json['team_list']);
      teamList = data.map((e) => TeamList.fromJson(e)).toList();
    }
  }

}

class TeamList{

  List<teamModel>? openTeam;

  TeamList({
    this.openTeam
  });

  TeamList.fromJson(var json){
    if(json['open_team']!=null){
      final data = List<Map<String , dynamic>>.from(json['open_team']);
      openTeam = data.map((e) => teamModel.fromJson(e)).toList();
    }
  }

}

// class OpenTeamModel{

//   List<teamModel>? teams;

//   OpenTeamModel({
//     this.teams
//   });

//   OpenTeamModel.fromJson(var json){
//     // if(json['open_team']!=null){
//     //   final data = List<Map<String , dynamic>>.from(json['open_team']);
//     //   teams = data.map((e) => teamModel.fromJson(e)).toList();
//     // }
//     teams = teamModel.fromJson(json['']);
//   }

// }