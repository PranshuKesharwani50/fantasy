// ignore_for_file: file_names, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10)
            ),
            // border: Border.all(
            //   color: borderColor2,
            //   width: 1
            // )
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            CircularProgressIndicator(
              color: appBarColor,
            ),
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
    barrierDismissible: true,
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

File? data;

pickFile() async{

  FilePickerResult? file = await FilePicker.platform.pickFiles();
  if(file != null){
    data = File(file.files.single.path!);
  }

  return data!;

}

pickImage(ImageSource source) async{

  ImagePicker img = ImagePicker();
  XFile? file = await img.pickImage(source: source);
  if(file != null){
    data = File(file.path);
  }

  return data;

}

File? output;

filePickerDailog(BuildContext context){

  showDialog(
    context: context, 
    builder: (ctx){
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: (){
                  output = pickImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt),
                color: appBarColor,
              ),
              IconButton(
                onPressed: (){
                  output = pickImage(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                color: appBarColor,
              ),
              IconButton(
                onPressed: (){
                  output = pickFile();
                },
                icon: Icon(Icons.folder),
                color: appBarColor,
              ),
            ],
          ),
        ),
      );
    });

  return output;

}