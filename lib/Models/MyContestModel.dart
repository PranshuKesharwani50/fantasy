// ignore_for_file: camel_case_types, file_names

import 'package:playon69/Models/MathesModel.dart';

class MyContestModel{

  bool? status;
  int? code;
  String? message;
  int? systemtime;
  Responce? responce;

  MyContestModel({
    this.status,
    this.code,
    this.message,
    this.systemtime,
    this.responce
  });
  

  MyContestModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    systemtime = json['system_time'];
    responce = Responce.fromJson(json['response']);
  }

  // Map<String , dynamic> toJson(){
  //   return {
  //     'status': status,
  //     'code': code,
  //     'message': message,
  //     'matchdata': gameHistory
  //   };
  // }

}

class Responce{

  List<MatchData>? matchData;

  Responce({
    this.matchData
  });

  Responce.fromJson(var json){
    if(json['matchdata']!=null){
      final data = List<Map<String , dynamic>>.from(json['matchdata']);
      matchData = data.map((e) => MatchData.fromJson(e)).toList();
    }
  }

}

class MatchData{

  String? actionType;
  List<MatchModel>? matchModel;

  MatchData({
    this.actionType,
    this.matchModel
  });

  MatchData.fromJson(var json){
    actionType = json['action_type'];
    if(json['completed']!=null){
      final data = List<Map<String , dynamic>>.from(json['completed']);
      matchModel = data.map((e) => MatchModel.fromJson(e)).toList();
    }
    if(json['live']!=null){
      final data = List<Map<String , dynamic>>.from(json['live']);
      matchModel = data.map((e) => MatchModel.fromJson(e)).toList();
    }
    if(json['upcoming']!=null){
      final data = List<Map<String , dynamic>>.from(json['upcoming']);
      matchModel = data.map((e) => MatchModel.fromJson(e)).toList();
    }
  }

}

class MatchModel{

  int? matchId;
  String? title;
  String? sortTitle;
  int? status;
  String? statusStart;
  int? timeStampStart;
  int? timeStampEnd;
  String? dateStart;
  String? dateEnd;
  int? gameState;
  String? gameStateStart;
  int? compitionId;
  bool? hasFreeContest;
  String? leageTitle;
  int? currentStatus;
  int? totalJoinedteam;
  int? totalJoinContest;
  int? totalCreatedTeam;
  int? prizeAmt;
  teamData? teama;
  teamData? teamb;

  MatchModel({
    this.matchId,
    this.title,
    this.sortTitle,
    this.status,
    this.statusStart,
    this.timeStampStart,
    this.timeStampEnd,
    this.dateStart,
    this.dateEnd,
    this.gameState,
    this.gameStateStart,
    this.compitionId,
    this.hasFreeContest,
    this.leageTitle,
    this.currentStatus,
    this.totalJoinedteam,
    this.totalJoinContest,
    this.totalCreatedTeam,
    this.prizeAmt,
    this.teama,
    this.teamb,
  });

  MatchModel.fromJson(var json){
    matchId = json['match_id'];
    title = json['title'];
    sortTitle = json['short_title'];
    status = json['status'];
    statusStart = json['status_str'];
    timeStampStart = json['timestamp_start'];
    timeStampEnd = json['timestamp_end'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    gameState = json['game_state'];
    gameStateStart = json['game_state_str'];
    compitionId = json['competition_id'];
    hasFreeContest = json['has_free_contest'];
    leageTitle = json['league_title'];
    currentStatus = json['current_status'];
    totalJoinedteam = json['total_joined_team'];
    totalJoinContest = json['total_join_contests'];
    totalCreatedTeam = json['total_created_team'];
    prizeAmt = json['prize_amount'];
    teama = teamData.fromJson(json['teama']);
    teamb = teamData.fromJson(json['teamb']);
  }

}

class upcomingTeamData{
  int? teamId;
  int? matchId;
  String? name;
  String? sortName;
  String? logo;
  String? localImg;
  String? fullScore;
  String? scores;
  String? overs;
  String? thumbUrl;

  upcomingTeamData({
    this.teamId,
    this.matchId,
    this.name,
    this.sortName,
    this.logo,
    this.localImg,
    this.fullScore,
    this.scores,
    this.overs,
    this.thumbUrl
  });

  upcomingTeamData.fromJson(var json){
    teamId = json['team_id'];
    matchId = json['match_id'];
    name = json['name'];
    sortName = json['short_name'];
    logo = json['logo_url'];
    localImg = json['local_img_url'];
    thumbUrl = json['thumb_url'];
    fullScore = json['scores_full'];
    scores =  json['scores'];
    overs = json['overs'];
  }
}