// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_import

import 'package:playon69/Extra/assets.dart';

//leader board model for leader board page

class LeaderBoardModel{

  int? systemTime;
  String? matchStatus;
  int? matchTime;
  bool? status;
  int? code;
  String? messsage;
  int? totalTerm;
  List<leaderBoardResponce>? leaderboard;

  LeaderBoardModel({
    this.systemTime,
    this.matchStatus,
    this.matchTime,
    this.status,
    this.code,
    this.messsage,
    this.totalTerm,
    this.leaderboard
  });

  LeaderBoardModel.fromJson(var json){
    systemTime = json['system_time'];
    matchStatus = json['match_status'];
    matchTime = json['match_time'];
    status = json['status'];
    code = json['code'];
    messsage = json['message'];
    totalTerm = json['total_term'];
    if(json['leaderBoard']!=null){
      final data = List<Map<String , dynamic>>.from(json['leaderBoard']);
      leaderboard = data.map((e) => leaderBoardResponce.fromJson(e)).toList();
    }
  }
}

class leaderBoardResponce{
  int? matchId;
  int? teamId;
  String? userId;
  String? team;
  int? point;
  int? rank;
  int? prizeAmount;
  int? winningAmount;
  leaderBoardUserModel? user;

  leaderBoardResponce({
    this.matchId,
    this.teamId,
    this.userId,
    this.team,
    this.point,
    this.rank,
    this.prizeAmount,
    this.winningAmount,
    this.user
  });

  leaderBoardResponce.fromJson(var json){
    matchId = json['match_id'];
    teamId = json['team_id'];
    userId = json['user_id'];
    team = json['team'];
    point = json['point'];
    rank = json['rank'];
    prizeAmount = json['prize_amount'];
    winningAmount = json['winning_amount'];
    user = leaderBoardUserModel.fromJson(json['user']);
  }
}

class leaderBoardUserModel{
  String? firstName;
  String? lastName;
  String? name;
  String? userName;
  String? teamName;
  String? profileImage;
  String? sortName;

  leaderBoardUserModel({
    this.firstName,
    this.lastName,
    this.name,
    this.userName,
    this.teamName,
    this.profileImage,
    this.sortName
  });

  leaderBoardUserModel.fromJson(var json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    userName = json['user_name'];
    teamName = json['team_name'];
    profileImage = json['profile_image'];
    sortName = json['short_name'];
  }
}

//price break model for prize breakup page

class PriceBreakupModel{

  bool? status;
  int? code;
  String? message;
  priceBreakupResponce? response;

  PriceBreakupModel({
    this.status,
    this.code,
    this.message,
    this.response
  });

  PriceBreakupModel.fromJson(var json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    response = priceBreakupResponce.fromJson(json['response']);
  }

}

class priceBreakupResponce{

  List<PriceBreakup>? priceBreakup;

  priceBreakupResponce({
    this.priceBreakup
  });

  priceBreakupResponce.fromJson(var json){
    if(json['prizeBreakup']!=null){
      final data = List<Map<String , dynamic>>.from(json['prizeBreakup']);
      priceBreakup = data.map((e) => PriceBreakup.fromJson(e)).toList();
    }
  }

}

class PriceBreakup{

  String? rank;
  int? price;

  PriceBreakup({
    this.rank,
    this.price
  });

  PriceBreakup.fromJson(var json){
    rank = json['range'];
    price = json['price'];
  }

}