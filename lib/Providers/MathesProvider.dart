import 'package:flutter/material.dart';
import 'package:playon69/Models/MathesModel.dart';

class MatchesProvider extends ChangeNotifier{

  MatchesModel? match;

  MatchesModel? get matches => match;

  List<BannersData>? get banners => match!.responce!.matchData![0].banners!;

  void insert(MatchesModel data){
    match = data;
    notifyListeners();
  }

}