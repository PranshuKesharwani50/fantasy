// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_typing_uninitialized_variables, file_names

class MatchesModel {
  bool? session_expired;
  bool? maintainance;
  int? systemTime;
  int? totalResult;
  int? code;
  bool? status;
  String? message;
  responceData? responce;

  MatchesModel({this.session_expired,this.maintainance,this.systemTime,this.totalResult,this.code,this.status,this.message,this.responce});

  MatchesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    totalResult = json['total_result'];
    systemTime = json['system_time'];
    session_expired = json['session_expired'];
    maintainance = json['maintainance'];
    if(json['response']!=null){
      responce = responceData.fromJson(json['response']);
    }
  }

}

class responceData{

  List<MatchData>? matchData;

  responceData({this.matchData});

  responceData.fromJson(var json){
    List<MatchData> dt = [];
    json['matchdata'].forEach((e) => dt.add(MatchData.fromJson(e)));
    matchData = dt;
  }

}

class MatchData{

  int? viewType;
  List<BannersData>? banners;
  List<upcomingMatchData>? upComingMatches;

  MatchData({
    this.viewType,
    this.banners,
    this.upComingMatches
  });

  MatchData.fromJson(var json){
    viewType = json['viewType'];
    if(json['banners']!=null){
      final data = List<Map<String , dynamic>>.from(json['banners']);
      banners = data.map((e) => BannersData.fromJson(e)).toList();
    }
    if(json['upcomingmatches']!=null){
      final data = List<Map<String , dynamic>>.from(json['upcomingmatches']);
      upComingMatches = data.map((e) => upcomingMatchData.fromJson(e)).toList();
    }
  }

}

class upcomingMatchData{

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
  int? isFree;
  int? compitionId;
  String? formatStyle;
  String? format;
  bool? hasFreeContest;
  String? timeLeft;
  bool? isLineUp;
  String? leageTitle;
  teamData? teama;
  teamData? teamb;
  String? eventName;

  upcomingMatchData({
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
    this.isFree,
    this.compitionId,
    this.formatStyle,
    this.format,
    this.hasFreeContest,
    this.timeLeft,
    this.isLineUp,
    this.leageTitle,
    this.teama,
    this.teamb,
    this.eventName
  });

  upcomingMatchData.fromJson(var json){
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
    isFree = json['is_free'];
    compitionId = json['competition_id'];
    formatStyle = json['format_str'];
    format = json['format'];
    hasFreeContest = json['has_free_contest'];
    timeLeft = json['time_left'];
    isLineUp = json['is_lineup'];
    leageTitle = json['league_title'];
    eventName = json['event_name'];
    teama = teamData.fromJson(json['teama']);
    teamb = teamData.fromJson(json['teamb']);
  }

}

class BannersData{

  String? bannerFor;
  String? actiontype;
  String? photo;
  int? status;
  String? link;
  String? viewtype;

  BannersData({
    this.bannerFor,
    this.actiontype,
    this.photo,
    this.status,
    this.link,
    this.viewtype,
  });

  BannersData.fromJson(var json){
    bannerFor = json['banner_for'];
    actiontype = json['action_type'];
    photo = json['photo'];
    status = json['status'];
    link = json['link'];
    viewtype = json['view_type'];
  }

}

class teamData{
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

  teamData({
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

  teamData.fromJson(var json){
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
