// ignore_for_file: camel_case_types, file_names, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Models/MyContestModel.dart';
import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';
import '../../widgets/MyUpcomingMatchesWidget.dart';

class liveMatch extends StatefulWidget {
  const liveMatch({super.key});

  @override
  State<liveMatch> createState() => _liveMatchState();
}

class _liveMatchState extends State<liveMatch> {
  
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
    myContests = await getMyContestHistory1(context, token, userId,'live');
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
        MyUpComingMatchesWidget()
        //upcominMatchWidget('', index)
      ],
    ) : 
    Center(
      child: CircularProgressIndicator(),
    );
  }
}