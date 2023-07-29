// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, use_build_context_synchronously, must_be_immutable, use_key_in_widget_constructors, camel_case_types, avoid_types_as_parameter_names, unnecessary_null_comparison, sized_box_for_whitespace, unused_local_variable

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/editTeamDetailsModel.dart';
import 'package:playon69/Models/myTeamModel.dart';
import 'package:playon69/Models/playersModel.dart';
import 'package:playon69/Providers/MatchContestProvider.dart';
import 'package:playon69/Providers/myTeamProvider.dart';
import 'package:playon69/Screens/PreviewTeam.dart';
import 'package:playon69/Screens/createTeam.dart';
import 'package:playon69/Screens/others/selectTeam.dart';
import 'package:playon69/apis/callApi.dart';
import 'package:playon69/customs/CustomButton.dart';
import 'package:playon69/widgets/timer.dart';
import 'package:provider/provider.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Models/MatchContest.dart';
import '../Models/MathesModel.dart';
import '../apis/sharedPreference.dart';
import 'others/leaderBoard.dart';

class joinTeam extends StatefulWidget {
  joinTeam({this.match});

  upcomingMatchData? match;

  @override
  State<joinTeam> createState() => _joinTeamState();
}

class _joinTeamState extends State<joinTeam> {

  MatchContest? data;
  myTeamModel? teamdata;

  bool isLoading = true;

  getMatchData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    var matchContest = await getMatchDataById1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name']);
    var myTeam = await getMyTeam1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name']);
    if(myTeam!.status==true && matchContest!.status==true){
      setState(() {
        isLoading = false;
        data = matchContest;
        teamdata = myTeam;
      });
    }
  }

  void getAvailableTeams(int contestId) async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    getNewContestStatus1(context, res['token'], '${widget.match!.matchId!}', contestId, res['user_data']['user_name']);
  }

  Future<void> refresh() async{
    getMatchData();
    Future.delayed(Duration(seconds: 2),(){});
  }

  void getMyTeamDetails(int? teamId) async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    editTeamDetailsModel responce = await getPoints1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], teamId!);
    if(responce.status==true){
      List<PlayerPoints> selectedTeam = [];
      List<PlayerPoints> wks = [];
      List<PlayerPoints> bats = [];
      List<PlayerPoints> alls = [];
      List<PlayerPoints> bowls = [];
      String? captain;
      String? viceCaptain;
      int teamA = 0;
      int teamB = 0;

      for(int x =0; x < responce.responce!.playerPoints!.length; x++){
        if(responce.responce!.playerPoints![x].role=='wk'){
          wks.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='bat'){
          bats.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='bowl'){
          bowls.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='all'){
          alls.add(responce.responce!.playerPoints![x]);
        }
        selectedTeam.add(responce.responce!.playerPoints![x]);
        if(responce.responce!.playerPoints![x].teamId==widget.match!.teama!.teamId){
          teamA++;
        }else{
          teamB++;
        }

        if(responce.responce!.playerPoints![x].captain==true){
          captain = responce.responce!.playerPoints![x].pId!;
        }else if(responce.responce!.playerPoints![x].viceCaptain==true){
          viceCaptain = responce.responce!.playerPoints![x].pId!;
        }
      }
      Navigator.of(context).pop();
      Navigator.push(context ,MaterialPageRoute(builder: (ctx)=> 
      PreviewTeam(
        selectedTeam: selectedTeam, 
        match: widget.match!, 
        wk: wks, 
        bats: bats, 
        all: alls, 
        bowls: bowls, 
        captain: int.parse(captain!).toInt(), 
        viceCaptain: int.parse(viceCaptain!).toInt(), 
        teamA: teamA, 
        teamB: teamB
        )
      ));
    }else{
      Navigator.of(context).pop();
    }
  }

  void editTeam(int? teamId,bool update) async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    editTeamDetailsModel responce = await getPoints1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], teamId!);
    if(responce.status==true){
      List<PlayerPoints> selectedTeam = [];
      List<PlayerPoints> wks = [];
      List<PlayerPoints> bats = [];
      List<PlayerPoints> alls = [];
      List<PlayerPoints> bowls = [];
      String? captain;
      String? viceCaptain;
      int teamA = 0;
      int teamB = 0;

      for(int x =0; x < responce.responce!.playerPoints!.length; x++){
        if(responce.responce!.playerPoints![x].role=='wk'){
          wks.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='bat'){
          bats.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='bowl'){
          bowls.add(responce.responce!.playerPoints![x]);
        }else if(responce.responce!.playerPoints![x].role=='all'){
          alls.add(responce.responce!.playerPoints![x]);
        }
        selectedTeam.add(responce.responce!.playerPoints![x]);
        if(responce.responce!.playerPoints![x].teamId==widget.match!.teama!.teamId){
          teamA++;
        }else{
          teamB++;
        }

        if(responce.responce!.playerPoints![x].captain==true){
          captain = responce.responce!.playerPoints![x].pId!;
        }else if(responce.responce!.playerPoints![x].viceCaptain==true){
          viceCaptain = responce.responce!.playerPoints![x].pId!;
        }
      }
      Navigator.of(context).pop();
      Navigator.push(context ,MaterialPageRoute(builder: (ctx)=> 
      CreateTeam(
        selectedTeam: selectedTeam, 
        match: widget.match!, 
        wk: wks, 
        bats: bats, 
        all: alls, 
        bowls: bowls, 
        captain: int.parse(captain!), 
        viceCaptain: int.parse(viceCaptain!), 
        teamA: teamA, 
        teamB: teamB,
        isUpdate: true,
        captainUpdate: update,
        )
      ));
    }else{
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    getMatchData();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {

    //var data = Provider.of<matchContestProvider>(context).matchInfo;
    //var teamdata = Provider.of<myTeamProvider>(context).teams;
    // var matches = data!.responce!.matchContests!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(goBack2),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.match!.teama!.sortName} vs ${widget.match!.teamb!.sortName}',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 2,),
                TimerWidget(mydurStart: widget.match!.timeStampStart!,mydurEnd: widget.match!.timeStampEnd!,startingTime: widget.match!.dateStart!,),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          // InkWell(
          //   onTap: (){},
          //   child: SvgPicture.asset(createTeamwin),
          // ),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){},
            child: SvgPicture.asset(walletHome),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        displacement: 30.0,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: isLoading==false ?  Container(
              child: Column(
                children: [
                  Container(
                    //color: upComingBg,
                    padding: EdgeInsets.all(15),
                    height: index==0 ? height(context , 0.15) : height(context, 0.13),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            ),
                            color: upComingBg,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                color: index==0 ? buttonBgColor : upComingBg,
                                label: 'Contests',
                                fontColor: index==0 ? textColor1 : textColor4,
                                fontFamily: font, 
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10), 
                                borderRadius: 5, 
                                widget: Container(), 
                                mainAlignment: MainAxisAlignment.center,
                                onTap: (){
                                  setState(() {
                                    index = 0;
                                  });
                                }, 
                                borderColor: index==0 ? borderColor2 : borderColor4, 
                                borderWidth: 0
                              ),
                              CustomButton(
                                color: index==1 ? buttonBgColor : upComingBg,
                                label: 'My Contests(${data!.responce!.myjoiningContest!.length})',
                                fontColor: index==1 ? textColor1 : textColor4,
                                fontFamily: font, 
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10), 
                                borderRadius: 5, 
                                widget: Container(), 
                                mainAlignment: MainAxisAlignment.center, 
                                onTap: (){
                                  setState(() {
                                    index = 1;
                                  });
                                }, 
                                borderColor: index==1 ? borderColor2 : borderColor4, 
                                borderWidth: 0
                              ),
                              CustomButton(
                                color: index==2 ? buttonBgColor : upComingBg,
                                label: 'My Teams(${data!.responce!.myJoiningTeam!.length})',
                                fontColor: index==2 ? textColor1 : textColor4,
                                fontFamily: font, 
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10), 
                                borderRadius: 5, 
                                widget: Container(), 
                                mainAlignment: MainAxisAlignment.center, 
                                onTap: (){
                                  setState(() {
                                    index = 2;
                                  });
                                }, 
                                borderColor: index==2 ? borderColor2 : borderColor4, 
                                borderWidth: 0
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 20,),
                        // if(index==0)
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('All Contests (${data!.responce!.matchContests![1].contests!.length})',
                        //       style: TextStyle(
                        //         fontFamily: font,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.bold,
                        //         color: textColor2
                        //       ),
                        //     ),
                        //     Row(
                        //       children: [
                        //         SvgPicture.asset(filter),
                        //         SizedBox(width: 5,),
                        //         Text('All Filters',
                        //           style: TextStyle(
                        //             fontFamily: font,
                        //             fontSize: 12,
                        //             color: textColor4
                        //           ),
                        //         ),
                        //       ],
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  if(index==0)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: upComingBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      child: Center(
                        child: data!.responce!.matchContests!.isNotEmpty ? Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  for(int x=0; x<data!.responce!.matchContests!.length; x++)
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(troppe),
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${data!.responce!.matchContests![x].contestTitle}',
                                                style: TextStyle(
                                                  color: textColor2,
                                                  fontSize: 15,
                                                  fontFamily: font,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(height: 2,),
                                              Text('${data!.responce!.matchContests![x].contestSubtitle}',
                                                style: TextStyle(
                                                  color: textColor4,
                                                  fontSize: 11,
                                                  fontFamily: font,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Column(
                                        children: [
                                          for(int y=0; y<data!.responce!.matchContests![x].contests!.length; y++)
                                          contestWidget(
                                            data!.responce!.matchContests![x].contests![y],
                                            data!.responce!.myJoiningTeam!.length,
                                            data!.responce!.myJoiningTeam!.isEmpty ? 0 : data!.responce!.myJoiningTeam![0].teamId!
                                          ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              )
                            )
                          ],
                        ) : Text('No Contests Found!',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                  if(index==1)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: upComingBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      child: Center(
                        child: data!.responce!.myjoiningContest!.isNotEmpty? ListView(
                          children: [
                            for(int z=0; z<data!.responce!.myjoiningContest!.length; z++)
                            //Container()
                            Column(
                              children: [
                                myContestTile(data!.responce!.myjoiningContest![z],),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            )
                          ],
                        ) : Text('No Contests Found!',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 15
                          ),
                        ),
                      ),
                    )
                  ),
                  if(index==2)
                  Consumer<myTeamProvider>(
                    builder: (context ,dt2 , child) {
                      return teamdata!=null ? Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: upComingBg,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                            )
                          ),
                          child: Center(
                            child: teamdata!.response!.team!.isNotEmpty ? ListView(
                              children: [
                                for(int x=0; x<teamdata!.response!.team!.length; x++)
                                //Text('Demo'),
                                myTeamtile(teamdata!.response!.team![x]),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ) : Text('No Teams Found!',
                              style: TextStyle(
                                fontFamily: font,
                                fontSize: 15
                              ),
                            ),
                          ) ,
                        )
                      ) : Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  )
                ]
              ),
            ) : Center(
          child: CircularProgressIndicator(),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: index!=1 ? (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
        } : (){
          setState(() {
            index = 0;
          });
        },
        child: Container(
          height: height(context, 0.06),
          width: width(context, 0.45),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: 15,
            bottom: 15
          ),
          // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5)
            ),
            color: index!=1 ? buttonBgColor : buttonBgColor4
          ),
          child: Text(index!=1 ? 'Create Team' : 'Join Contest',
            style: TextStyle(
              fontFamily: font,
              color: textColor1
            ),
          ),
        ),
      )
    );
  }

  Widget myTeamtile(teamModel? team){
    return Column(
      children: [
        Container(
          width: double.infinity,
          //padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(myTeamBg),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   // topRight: Radius.circular(10),
                  //   // topLeft: Radius.circular(10)
                  // ),
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: borderColor3
                    )
                  ),
                  //color: Colors.red
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Checkbox(
                    //   value: false, 
                    //   onChanged: (value){
                        
                    //   }
                    // ),
                    Text('Team',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        color: textColor1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            showLoadingDailog(context, 'please wait...');
                            editTeam(team!.createdTeam!.team_Id,true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(edit),
                              SizedBox(width: 5,),
                              Text('Edit',
                                style: TextStyle(
                                  color: textColor1,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              )
                            ],
                          )
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            showLoadingDailog(context, 'please wait...');
                            getMyTeamDetails(team!.createdTeam!.team_Id);
                            //Navigator.push(context ,MaterialPageRoute(builder: (ctx)=> PreviewTeam(selectedTeam: selectedTeam, match: match, wk: wk, bats: bats, all: all, bowls: bowls, captain: captain, viceCaptain: viceCaptain, teamA: teamA, teamB: teamB)));
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(preview),
                              SizedBox(width: 5,),
                              Text('Preview',
                                style: TextStyle(
                                  color: textColor1,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              )
                            ],
                          )
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            showLoadingDailog(context, 'please wait...');
                            editTeam(team!.createdTeam!.team_Id,false);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(clone),
                              SizedBox(width: 5,),
                              Text('Clone',
                                style: TextStyle(
                                  color: textColor1,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: team!.cImage!,
                              height: 50,
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              width: width(context, 0.2),
                              child: Text('${team.captain!.name}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: textColor1
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3.5
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100)
                              ),
                              color: buttonBgColor
                            ),
                            child: Text('C',
                              style: TextStyle(
                                color: textColor1,
                                fontSize: 11
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('${team.teams![0].name}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor1
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2.5
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100)
                            ),
                            color: Colors.white
                          ),
                          child: Text('${team.teams![0].count}',
                            style: TextStyle(
                              color: textColor2
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('${team.teams![1].name}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor1
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2.5
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100)
                            ),
                            color: Colors.white
                          ),
                          child: Text('${team.teams![1].count}',
                            style: TextStyle(
                              color: textColor2
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: team.vcImage!,
                              height: 50,
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              width: width(context, 0.2),
                              child: Text('${team.viceCaptain!.name}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: textColor1
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.5,
                              vertical: 3.5
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100)
                              ),
                              color: buttonBgColor2
                            ),
                            child: Text('VC',
                              style: TextStyle(
                                color: textColor1,
                                fontSize: 11
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('WK(${team.wks!.length})',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        color: textColor1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('BAT(${team.bats!.length})',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        color: textColor1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('AR(${team.all!.length})',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        color: textColor1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('BOWL(${team.bowls!.length})',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        color: textColor1,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }

  Widget myContestTile(myJoinedContest? contest){
    return InkWell(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (ctx) => LeaderBoard(
              match: widget.match,
              contest: contest,
            )
          )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          ),
          color: appBgColor
        ),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prize Pool',
                        style: TextStyle(
                          color: textColor4,
                          fontFamily: font,
                          fontSize: 12
                        )
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          SvgPicture.asset(coin,height: 18,),
                          SizedBox(width: 5,),
                          Text('₹${contest!.totalWinningPrice}',
                            style: TextStyle(
                              color: textColor2,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                      border: Border.all(
                        width: 0.5,
                        color: borderColor3
                      )
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(tag),
                        SizedBox(width: 10,),
                        Text('Winners : ${contest.winnerCount}',
                          style: TextStyle(
                            fontFamily: font,
                            color: textColor4,
                            fontSize: 12
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Entry Fee',
                        style: TextStyle(
                          color: textColor4,
                          fontFamily: font,
                          fontSize: 10
                        )
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          //joinContest(contest.contestId!);
                          // getAvailableTeams(contest.contestId!);
                          // joinContestBottomSheet();
    
    
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (ctx) => SelectTeam(
                                match: widget.match,
                                maxTeamAllowed: contest.maxTeamAllowed,
                                useableBonus: contest.unableBonus,
                                contestId: contest.contestId,
                                entryFee: contest.entryFee,
                                //contest: contest,
                              )
                            )
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(3)
                            ),
                            color: entryFeebox
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(coin,height: 12,),
                              SizedBox(width: 3,),
                              Text('₹${contest.entryFee}',
                                style: TextStyle(
                                  color: textColor1,
                                  fontFamily: font,
                                  fontSize: 11
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: progressBarBgColor,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(first),
                            SizedBox(width: 10,),
                            SvgPicture.asset(coin,height: 12,),
                            SizedBox(width: 2,),
                            Text('₹${contest.firstPrice}',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                            // SizedBox(width: 20,),
                            // SvgPicture.asset(winPer),
                            // SizedBox(width: 5,),
                            // Text('${contest.winningPercentage} %',
                            //   style: TextStyle(
                            //         color: textColor4,
                            //         fontFamily: font,
                            //         fontSize: 11
                            //       )
                            // ),
                            SizedBox(width: 20,),
                            SvgPicture.asset(m2),
                            SizedBox(width: 5,),
                            Text('Upto ${contest.maxTeamAllowed}',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                          ],
                        ),
                        if(contest.cancellation==false)
                        Row(
                          children: [
                            Text('Guaranted  ',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                            SvgPicture.asset(check),
                          ],
                        )
                      ],
                    ),
                  ),
                  LinearProgressIndicator(
                    value: (contest.filledSpots! * 100 / contest.totalSpots!) /100 ,
                    //value: 0.7,
                    color: progressColor,
                    backgroundColor: unProgressColor,
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${contest.totalSpots! - contest.filledSpots!} Left',
                        style: TextStyle(
                          color: textColor5,
                          fontFamily: font,
                          fontSize: 12
                        )
                      ),
                      Text('${contest.totalSpots} Spots',
                        style: TextStyle(
                          color: textColor4,
                          fontFamily: font,
                          fontSize: 12
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(troppe,
                  //       height: 15,
                  //     ),
                  //     SizedBox(width: 5,),
                  //     Text('₹${contest.firstPrice!}',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         fontFamily: font
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: 10,),
                  for(int y=0; y<contest.joinedTeams!.length; y++)
                  InkWell(
                    onTap: (){
                      showLoadingDailog(context, 'please wait...');
                      getMyTeamDetails(contest.joinedTeams![y].createdTeamId);
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            ),
                            color: upcomingmatchCardBottomBg
                          ),
                          padding: EdgeInsets.only(
                            top: 10,bottom: 10,right: 10,left: 10
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${contest.joinedTeams![y].teamName}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font
                                ),
                              ),
                              Text('${contest.joinedTeams![y].points}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: textColor4
                                ),
                              ),
                              Text('#${contest.joinedTeams![y].rank}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: textColor4
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contestWidget(contestsData? contest,int teamLenght,int teamId){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10)
            ),
            color: appBgColor,
          ),    
          width: double.infinity,
          // height: 130,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Prize Pool',
                          style: TextStyle(
                            color: textColor4,
                            fontFamily: font,
                            fontSize: 12
                          )
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            SvgPicture.asset(coin,height: 18,),
                            SizedBox(width: 5,),
                            Text('₹${contest!.firstPrice}',
                              style: TextStyle(
                                color: textColor2,
                                fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5)
                        ),
                        border: Border.all(
                          width: 0.5,
                          color: borderColor3
                        )
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(tag),
                          SizedBox(width: 10,),
                          Text('Winners : ${contest.winnerCount}',
                            style: TextStyle(
                              fontFamily: font,
                              color: textColor4,
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Entry Fee',
                          style: TextStyle(
                            color: textColor4,
                            fontFamily: font,
                            fontSize: 10
                          )
                        ),
                        SizedBox(height: 5,),
                        InkWell(
                          onTap: (){
                            //joinContest(contest.contestId!);
                            // getAvailableTeams(contest.contestId!);
                            // joinContestBottomSheet();
                            if(teamLenght==0){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
                            }else if(teamLenght==1){
                              joinContestDailog(
                                context, 
                                contest.entryFees!, 
                                contest.usableBonus!=null ? contest.usableBonus! : 0, 
                                [teamId], 
                                widget.match, 
                                contest.contestId
                              );
                            }else{
                              Navigator.push(
                              context, MaterialPageRoute(
                                builder: (ctx) => SelectTeam(
                                  match: widget.match,
                                  maxTeamAllowed: contest.maxTeamAllowed,
                                  useableBonus: contest.usableBonus,
                                  contestId: contest.contestId,
                                  entryFee: contest.entryFees,
                                  //contest: contest,
                                  )
                                )
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3)
                              ),
                              color: entryFeebox
                            ),
                            child: Row(
                              children: [
                                Image.asset(coin,height: 12,),
                                SizedBox(width: 3,),
                                Text('₹${contest.entryFees}',
                                  style: TextStyle(
                                    color: textColor1,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: progressBarBgColor,
                width: double.infinity,
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (contest.filledSlot! * 100 / contest.totalSports!) /100 ,
                      //value: 0.7,
                      color: progressColor,
                      backgroundColor: unProgressColor,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${contest.totalSports! - contest.filledSlot!} Left',
                          style: TextStyle(
                            color: textColor5,
                            fontFamily: font,
                            fontSize: 12
                          )
                        ),
                        Text('${contest.totalSports!} Spots',
                          style: TextStyle(
                            color: textColor4,
                            fontFamily: font,
                            fontSize: 12
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(first),
                        SizedBox(width: 10,),
                        SvgPicture.asset(coin,height: 12,),
                        SizedBox(width: 2,),
                        Text('₹${contest.totalWinningPrice}',
                          style: TextStyle(
                                color: textColor4,
                                fontFamily: font,
                                fontSize: 11
                              )
                        ),
                        SizedBox(width: 20,),
                        SvgPicture.asset(winPer),
                        SizedBox(width: 5,),
                        Text('${contest.winningPercentage} %',
                          style: TextStyle(
                                color: textColor4,
                                fontFamily: font,
                                fontSize: 11
                              )
                        ),
                        SizedBox(width: 20,),
                        SvgPicture.asset(m2),
                        SizedBox(width: 5,),
                        Text('Upto ${contest.maxTeamAllowed}',
                          style: TextStyle(
                                color: textColor4,
                                fontFamily: font,
                                fontSize: 11
                              )
                        ),
                      ],
                    ),
                    if(contest.cancellation==false)
                    Row(
                      children: [
                        Text('Guaranted  ',
                            style: TextStyle(
                                  color: textColor4,
                                  fontFamily: font,
                                  fontSize: 11
                                )
                          ),
                        SvgPicture.asset(check),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  // joinContestBottomSheet(){

  //   showModalBottomSheet(
  //     isDismissible: false,
  //     enableDrag: false,
  //     isScrollControlled: true,
  //     context: context, 
  //     builder: (ctx){
  //       return Container(
  //         //color: upComingBg,
  //         height: height(context, 0.8),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(10),
  //                   child: InkWell(
  //                     onTap: (){
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: SvgPicture.asset(close)
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Expanded(
  //               child: SelectTeam()
  //             ),
  //           ],
  //         )
  //       );
  //     }
  //   );

  //}

}

// class ContestWidget extends StatelessWidget {
//   ContestWidget({this.contest});

//   contestsData? contest;

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }