class editTeamDetailsModel{

  bool? status;
  int? code;
  int? matchId;
  String? message;
  int? totalPoint;
  Responce2? responce;

  editTeamDetailsModel({
    this.status,
    this.code,
    this.matchId,
    this.message,
    this.totalPoint,
    this.responce
  });

  editTeamDetailsModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    matchId = json['match_id'];
    message = json['message'];
    totalPoint = json['total_points'];
    responce = Responce2.fromJson(json['response']);
  }

}

class Responce2{

  List<PlayerPoints>? playerPoints;

  Responce2({
    this.playerPoints
  });

  Responce2.fromJson(var json){
    if(json['player_points']!=null){
      final data = List<Map<String , dynamic>>.from(json['player_points']);
      playerPoints = data.map((e) => PlayerPoints.fromJson(e)).toList();
    }
  }

}

class PlayerPoints{

  String? pId;
  int? teamId;
  String? name;
  String? sortName;
  String? playerImage;
  double? points;
  double? fantasyPlayerRating;
  String? role;
  bool? captain;
  bool? viceCaptain;
  bool? trump;
  String? playing11;

  PlayerPoints({
    this.pId,
    this.teamId,
    this.name,
    this.sortName,
    this.playerImage,
    this.points,
    this.fantasyPlayerRating,
    this.role,
    this.captain,
    this.viceCaptain,
    this.trump,
    this.playing11,
  });

  PlayerPoints.fromJson(var json){
    pId = json['pid'];
    teamId = json['team_id'];
    name = json['name'];
    sortName = json['short_name'];
    playerImage = json['player_image'];
    points = double.parse(json['points'].toString());
    fantasyPlayerRating = double.parse(json['fantasy_player_rating'].toString());
    role = json['role'];
    captain = json['captain'];
    viceCaptain = json['vice_captain'];
    trump = json['trump'];
    playing11 = json['playing11'].toString();
  }

}