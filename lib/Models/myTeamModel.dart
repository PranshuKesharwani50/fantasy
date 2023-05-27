// ignore_for_file: non_constant_identifier_names, camel_case_types

class myTeamModel{

  int? systemTime;
  String? matchStatus;
  int? matchTime;
  bool? status;
  int? code;
  int? teamCount;
  String? message;
  teamResponceModel? response;

  myTeamModel({
    this.systemTime,
    this.matchStatus,
    this.matchTime,
    this.status,
    this.code,
    this.teamCount,
    this.message,
    this.response,
  });

  myTeamModel.fromJson(var json){
    systemTime = json['system_time'];
    matchStatus = json['match_status'];
    matchTime = json['match_time'];
    status = json['status'];
    code = json['code'];
    teamCount = json['teamCount'];
    message = json['message'];
    response = teamResponceModel.fromJson(json['response']);
  }

}

class teamResponceModel{

  List<teamModel>? team;

  teamResponceModel({
    this.team
  });

  teamResponceModel.fromJson(var json){
    if(json['myteam']!=null){
      final data = List<Map<String , dynamic>>.from(json['myteam']);
      team = data.map((e) => teamModel.fromJson(e)).toList();
    }
  }

}

class teamModel{

  teamId? createdTeam;
  List<dynamic>? all;
  List<dynamic>? wks;
  List<dynamic>? bats;
  List<dynamic>? bowls;
  captainModel? captain;
  captainModel? viceCaptain;
  List<dynamic>? matchTitle;
  List<teamsModel>? teams;
  String? cImage;
  String? vcImage;
  String? tImage;
  String? teamName;
  int? points;
  int? rank;

  teamModel({
    this.createdTeam,
    this.all,
    this.wks,
    this.bats,
    this.bowls,
    this.captain,
    this.viceCaptain,
    this.matchTitle,
    this.teams,
    this.cImage,
    this.vcImage,
    this.tImage,
    this.teamName,
    this.points,
    this.rank
  });

  teamModel.fromJson(var json){
    createdTeam = teamId.fromJson(json['created_team']);
    all = json['all'];
    wks = json['wk'];
    bats = json['bat'];
    bowls = json['bowl'];
    captain = captainModel.fromJson(json['c']);
    viceCaptain = captainModel.fromJson(json['vc']);
    matchTitle = json['match'];
    if(json['team']!=null){
      final data = List<Map<String , dynamic>>.from(json['team']);
      teams = data.map((e) => teamsModel.fromJson(e)).toList();
    }
    cImage = json['c_img'];
    vcImage = json['vc_img'];
    tImage = json['t_img'];
    teamName = json['team_name'];
    points = json['points'];
    rank = json['rank'];
  }
}

class captainModel{

  int? pid;
  String? name;

  captainModel({
    this.pid,
    this.name,
  });

  captainModel.fromJson(var json){
    pid = json['pid'];
    name = json['name'];
  }

}

class teamsModel{
  String? name;
  int? count;

  teamsModel({
    this.name,
    this.count
  });

  teamsModel.fromJson(var json){
    name = json['name'];
    count = json['count'];
  }
}

class teamId{

  int? team_Id;

  teamId({
    this.team_Id
  });

  teamId.fromJson(var json){
    team_Id = json['team_id'];
  }

}