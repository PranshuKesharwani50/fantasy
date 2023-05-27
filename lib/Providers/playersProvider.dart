import 'package:flutter/material.dart';

import '../Models/playersModel.dart';

class PlayersProvider extends ChangeNotifier{

  PlayersModel? players;
  
  PlayersModel? get allPlayers => players;

  void insert(PlayersModel? input){
    players = input;
    notifyListeners();
  }

}