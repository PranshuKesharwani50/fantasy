// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../Models/MyContestModel.dart';
import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';
import '../../widgets/MyUpcomingMatchesWidget.dart';

class CompleteMatch extends StatefulWidget {
  const CompleteMatch({super.key});

  @override
  State<CompleteMatch> createState() => _CompleteMatchState();
}

class _CompleteMatchState extends State<CompleteMatch> {
  
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
    myContests = await getMyContestHistory1(context, token, userId,'completed');
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
        MyUpComingMatchesWidget(myContests: myContests!.responce!.matchData![0].matchModel![x],)
      ],
    ) : 
    Center(
      child: CircularProgressIndicator(),
    );
  }
}