// ignore_for_file: camel_case_types


class PlayersModel{

  int? systemTime;
  bool? status;
  int? code;
  String? message;
  responseData? response;

  PlayersModel({
    this.systemTime,
    this.code,
    this.message,
    this.status,
    this.response
  });

  PlayersModel.fromJson(var json){
    systemTime = json['system_time'];
    code = json['code'];
    message = json['message'];
    status = json['status'];
    response = responseData.fromJson(json['response']);
  }

}

class responseData{

  players? player;

  responseData({
    this.player
  });

  responseData.fromJson(var json){
    player = players.fromJson(json['players']);
  }

}

class players{

  List<PlayersData>? wk;
  List<PlayersData>? all;
  List<PlayersData>? bat;
  List<PlayersData>? bowl;

  players({
    this.wk,
    this.all,
    this.bat,
    this.bowl
  });

  players.fromJson(var json){
    if(json['wk']!=null){
      final data = List<Map<String , dynamic>>.from(json['wk']);
      wk = data.map((e) => PlayersData.fromJson(e)).toList();
    }
    if(json['all']!=null){
      final data = List<Map<String , dynamic>>.from(json['all']);
      all = data.map((e) => PlayersData.fromJson(e)).toList();
    }
    if(json['all']!=null){
      final data = List<Map<String , dynamic>>.from(json['bat']);
      bat = data.map((e) => PlayersData.fromJson(e)).toList();
    }
    if(json['all']!=null){
      final data = List<Map<String , dynamic>>.from(json['bowl']);
      bowl = data.map((e) => PlayersData.fromJson(e)).toList();
    }
  }

}

class PlayersData{

  int? playerPoints;
  String? teamName;
  int? pId;
  int? matchId;
  int? teamId;
  String? playerImage;
  String? points;
  String? sortName;
  String? fantasyPlayerRating;
  analyticsData? analytics;
  bool? playing11;

  PlayersData({
    this.playerPoints,
    this.teamName,
    this.pId,
    this.matchId,
    this.teamId,
    this.playerImage,
    this.points,
    this.sortName,
    this.fantasyPlayerRating,
    this.analytics,
    this.playing11,
  });

  PlayersData.fromJson(var json){
    playerPoints = json['playerPoints'];
    teamName = json['team_name'];
    pId = json['pid'];
    matchId = json['match_id'];
    teamId = json['team_id'];
    playerImage = json['layer_image'];
    points = json['points'];
    sortName = json['short_name'];
    fantasyPlayerRating = json['fantasy_player_rating'];
    analytics = analyticsData.fromJson(json['analytics']);
    playing11 = json['playing11'];
  }

}

class analyticsData{

  String? selection;
  String? trump;
  String? viceCaptain;
  String? captain;

  analyticsData({
    this.captain,
    this.viceCaptain,
    this.selection,
    this.trump
  });

  analyticsData.fromJson(var json){
    captain = json['captain'].toString();
    viceCaptain = json['vice_captain'].toString();
    selection = json['selection'].toString();
    trump = json['trump'].toString();
  }

}