// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:playon69/Models/availableTeamModel.dart';
import 'package:playon69/Models/editTeamDetailsModel.dart';
import 'package:playon69/Models/leaderBoardModel.dart';
import 'package:playon69/Models/myTeamModel.dart';
import 'package:playon69/Providers/CurrentUserProvider.dart';
import 'package:playon69/Providers/MathesProvider.dart';
import 'package:playon69/Providers/myTeamProvider.dart';
import 'package:playon69/Providers/playersProvider.dart';
import 'package:playon69/Screens/MenuScreen.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/sharedPreference.dart';
import 'package:provider/provider.dart';

import '../Models/MatchContest.dart';
import '../Models/MathesModel.dart';
import '../Models/playersModel.dart';
import '../Providers/MatchContestProvider.dart';
import '../Providers/newContestStatusProvider.dart';

loginUser1(BuildContext context,String mobile,String password,String userType) async{
  var responce = await loginUser(mobile, password, userType);
  if(responce['status']==true){
    LoginResponceModel user = LoginResponceModel.fromJson(responce);
    insertPref(method: methods.String, key: 'currentUser', value: json.encode(responce));
    Provider.of<CurrentUserProvider>(context,listen: false).insert(user);
    Fluttertoast.showToast(msg: '${responce['message']}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MenuScreen())));
  }else{
    Fluttertoast.showToast(msg: '${responce['message']}');
  }
}

getMatches1(BuildContext context, String token) async{
  var responce = await getMatches(token);
  MatchesModel match = MatchesModel.fromJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    Provider.of<MatchesProvider>(context , listen: false).insert(match); 
  });
  return match;
}

getMatchDataById1(BuildContext context, String token,String gameId,String userId) async{
  var responce = await getMatchDataById(token,gameId,userId);
  print('$responce');
  MatchContest match = MatchContest.fromJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    Provider.of<matchContestProvider>(context , listen: false).insert(match); 
  });
  return match;
}

getMyTeam1(BuildContext context, String token,String gameId,String userId) async{
  var responce = await getMyTeam(token,gameId,userId);
  print('team responce : $responce');
  myTeamModel myTeam = myTeamModel.fromJson(responce);
  // MatchContest match = MatchContest.fromJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    Provider.of<myTeamProvider>(context , listen: false).insert(myTeam); 
  });
  return myTeam;
}

getPlayers1(BuildContext context, String token,String gameId) async{
  var responce = await getPlayers(token,gameId);
  print('$responce');
  PlayersModel players = PlayersModel.fromJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    Provider.of<PlayersProvider>(context , listen: false).insert(players); 
  });
  return players;
}

getNewContestStatus1(BuildContext context, String token,String gameId, int contestId, String userId) async{
  var responce = await getNewContestStatus(token, gameId, userId, contestId);
  print('$responce');
  AvailableTeamModel teams = AvailableTeamModel.fomJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    Provider.of<NewContestStatusProvider>(context , listen: false).insert(teams); 
  });
  return teams;
}

getPoints1(BuildContext context, String token,String gameId,String userId,int teamId) async{
  var responce = await getPoints(token,gameId,userId,teamId);
  editTeamDetailsModel data = editTeamDetailsModel.fromJson(responce);
  Future.delayed(Duration(seconds: 1),(){
    //Provider.of<NewContestStatusProvider>(context , listen: false).insert(data); 
  });
  return data;
}

getPriceBreakUp1(BuildContext context, String token,String gameId,String userId,int contestId) async{
  var responce = await getPriceBreakUp(token, gameId, userId, contestId);
  PriceBreakupModel priceBreakup = PriceBreakupModel.fromJson(responce);
  return priceBreakup;
}

getLeaderBoard1(BuildContext context, String token,String gameId,String userId,int contestId) async{
  var responce = await getLeaderBoard(token, gameId, userId, contestId);
  LeaderBoardModel priceBreakup = LeaderBoardModel.fromJson(responce);
  return priceBreakup;
}