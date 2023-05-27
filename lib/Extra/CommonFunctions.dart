// ignore_for_file: file_names, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Models/UserModel.dart';

import '../Models/MathesModel.dart';
import '../widgets/joinContestConfermation.dart';

height(BuildContext context,double value){
  return MediaQuery.of(context).size.height * value;
}

width(BuildContext context,double value){
  return MediaQuery.of(context).size.width * value;
}

storeUser(var responce) async{
  var data = json.decode(responce.body);
  LoginResponceModel loginResponce = LoginResponceModel.fromJson(data);
  print(loginResponce.userData!.id);
}

showLoadingDailog(BuildContext context,String message) async{
  showDialog(
    context: context, 
    builder: (ctx){
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(children: [
            CircularProgressIndicator(),
            SizedBox(width: 10,),
            Text(message,
              style: TextStyle(
                fontFamily: font,
              ),
            )
          ]),
        ),
      );
    }
  );
}

joinContestDailog(
  BuildContext context,
  int entryFee,
  int useAbleBonus,
  List<int> teamIds,
  upcomingMatchData? match,
  int? contestId
  ){

  showDialog(
    context: context, 
    builder: (cxt){
      return Dialog(
        backgroundColor: Colors.transparent,
        child: JoinContestConfermation(
          entryFee: entryFee,
          useAbleBonus: useAbleBonus,
          teamIds: teamIds,
          match: match,
          contestId: contestId,
        )
      );
    });

}