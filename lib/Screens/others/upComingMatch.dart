// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:playon69/Models/MyContestModel.dart';
import 'package:playon69/widgets/MyUpcomingMatchesWidget.dart';

import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';

class UpComingMatches extends StatefulWidget {
  const UpComingMatches({super.key});

  @override
  State<UpComingMatches> createState() => _UpComingMatchesState();
}

class _UpComingMatchesState extends State<UpComingMatches> {

  bool isLoading = true;
  MyContestModel? myContests;

  @override
  void initState() {
    super.initState();
    matchHistory();
  }

  void matchHistory() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    String token = res['token'];
    String userId = res['user_data']['user_name'];
    myContests = await getMyContestHistory1(context, token, userId,'upcoming');
    if(myContests!.status == true){
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return isLoading == false ? ListView(
      children: [
        for(int x=0; x< myContests!.responce!.matchData![0].matchModel!.length; x++)
        MyUpComingMatchesWidget(),
      ],
    ) : 
    Center(
      child: CircularProgressIndicator(),
    );
  }
}