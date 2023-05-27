// ignore_for_file: file_names, camel_case_types, constant_identifier_names, unused_import, avoid_print, unused_local_variable

//this methods enum used for shared prefernces data insertion
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum methods {
  bool,
  String,
  int,
  double,
  listString,
  Maps,
}

enum classModel{
  LoginResponceModel,
}

//this method is for save data using shared preferences
void insertPref({required methods method,required String key,required var value}) async{

  var responce = await SharedPreferences.getInstance();

  if(method == methods.bool){
    responce.setBool(key, value);
  }else if(method == methods.String){
    responce.setString(key, value);
  }else if(method == methods.int){
    responce.setInt(key, value);
  }else if(method == methods.double){
    responce.setDouble(key, value);
  }else if(method == methods.listString){
    responce.setStringList(key, value);
  }else{
    print('invalid method');
  }
}

//this method is for retrive data from shared preferences
retrivePref({required methods method,required String key}) async{
  var responce = await SharedPreferences.getInstance();
  if(method == methods.Maps){
    String data = responce.getString(key).toString();
    return json.decode(data);
  }else{
    return responce.get(key);
  }
}

//this method is for delete data from shared preferences
void removePref({required BuildContext context,required String key}) async{
  var responce = await SharedPreferences.getInstance();
  responce.remove(key);
  //Provider.of<CheckUserProvider>(context,listen: false).update(false);
}


checkUser(BuildContext context)async{
  var responce = await retrivePref(method: methods.Maps,key: 'currentUser');
  if(responce==null){
    //Provider.of<CheckUserProvider>(context,listen: false).update(false);
  }else{
    //storeUserModel(responce, context);
    //Provider.of<CheckUserProvider>(context,listen: false).update(true);
  }
  return responce;
}

convertToModelData(classModel model,var responce){
  var data;
  final value = List<Map<String , dynamic>>.from(responce);

  // if(model==classModel.LoginResponceModel){
  //   data = LoginResponceModel.fromJson(responce);
  // }
  // }else if(model==classModel.AllBanners){
  //   data = value.map((e) => AllBanners.fromJson(e)).toList();
  // }else if(model==classModel.AllGameModel){
  //   data = value.map((e) => AllGamesModel.fromJson(e)).toList();
  // }else if(model==classModel.RecentWithdrawModel){
  //   data = value.map((e) => RecentWithdrawModel.fromJson(e)).toList();
  // }
  return data;
}

convertModelToJson(var responce){
  return responce.map((e) => e.toJson()).toList();
}