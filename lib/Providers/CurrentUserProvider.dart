// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:provider/provider.dart';

class CurrentUserProvider extends ChangeNotifier{
  
  LoginResponceModel? currentUser;

  LoginResponceModel get userData => currentUser!;

  void insert(LoginResponceModel data){
    currentUser = data;
    notifyListeners();
  }
   
}