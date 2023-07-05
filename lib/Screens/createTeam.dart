// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable, camel_case_types, sized_box_for_whitespace, use_key_in_widget_constructors, sort_child_properties_last, unnecessary_null_comparison, list_remove_unrelated_type, unused_local_variable, avoid_function_literals_in_foreach_calls

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/MathesModel.dart';
import 'package:playon69/Models/playersModel.dart';
import 'package:playon69/Providers/playersProvider.dart';
import 'package:playon69/Screens/CreateCaptain.dart';
import 'package:playon69/Screens/PreviewTeam.dart';
import 'package:playon69/apis/callApi.dart';
import 'package:provider/provider.dart';

import '../Extra/AppTheme.dart';
import '../apis/sharedPreference.dart';
import '../widgets/timer.dart';

class CreateTeam extends StatefulWidget {
  CreateTeam({
    this.selectedTeam,
    required this.match,
    this.wk,
    this.bats,
    this.all,
    this.bowls,
    this.captain,
    this.viceCaptain,
    this.teamA,
    this.teamB,
    this.isUpdate,
    this.captainUpdate
  });

  upcomingMatchData? match;
  int? teamId;
  List<dynamic>? selectedTeam = [];
  List<dynamic>? wk = [];
  List<dynamic>? bats = [];
  List<dynamic>? all = [];
  List<dynamic>? bowls = [];
  int? captain;
  int? viceCaptain;
  int? teamA;
  int? teamB;
  bool? isUpdate = false;
  bool? captainUpdate = true;

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {

  int index = 0;

  PlayersModel? players;

  getPlayersData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    players = await getPlayers1(context, res['token'], '${widget.match!.matchId!}');
  }

  List<bool> bats = [];
  List<bool> bowls = [];
  List<bool> alls = [];
  List<bool> wks = [];

  List<int> allPlayersId = [];

  List<dynamic> wkPlayer = [];
  List<dynamic> batPlayer = [];
  List<dynamic> allPlayer = [];
  List<dynamic> bowlPlayer = [];

  void initData(){

    selectedPlayer.clear();

    if(widget.isUpdate==true){
      widget.selectedTeam!.forEach((element) {
        allPlayersId.add(int.parse(element!.pId.toString()));
      });
      teamA = widget.teamA!;
      teamB = widget.teamB!;
      playersSelected = widget.selectedTeam!.length;
      // selectedPlayer = widget.selectedTeam!;
      // wkPlayer = widget.wk!;
      //allPlayer = widget.all!;
      //bowlPlayer = widget.bowls!;
      //batPlayer = widget.bats!;
      wkSelected = widget.wk!.length;
      batSelected = widget.bats!.length;
      bowlSelected = widget.bowls!.length;
      allSelected = widget.all!.length;
      
    for(int x=0; x < widget.wk!.length; x++){
      for(int y=0; y<players!.response!.player!.wk!.length; y++){
        if(players!.response!.player!.wk![y].pId==int.parse(widget.wk![x].pId)){
          selectedPlayer.add(players!.response!.player!.wk![y]);
          wkPlayer.add(players!.response!.player!.wk![y]);
        }
      }
    }

    for(int x=0; x < widget.bats!.length; x++){
      for(int y=0; y<players!.response!.player!.bat!.length; y++){
        if(players!.response!.player!.bat![y].pId==int.parse(widget.bats![x].pId)){
          selectedPlayer.add(players!.response!.player!.bat![y]);
          batPlayer.add(players!.response!.player!.bat![y]);
        }
      }
    }

    for(int x=0; x < widget.all!.length; x++){
      for(int y=0; y<players!.response!.player!.all!.length; y++){
        if(players!.response!.player!.all![y].pId==int.parse(widget.all![x].pId)){
          selectedPlayer.add(players!.response!.player!.all![y]);
          allPlayer.add(players!.response!.player!.all![y]);
        }
      }
    }

    for(int x=0; x < widget.bowls!.length; x++){
      for(int y=0; y<players!.response!.player!.bowl!.length; y++){
        if(players!.response!.player!.bowl![y].pId==int.parse(widget.bowls![x].pId)){
          selectedPlayer.add(players!.response!.player!.bowl![y]);
          bowlPlayer.add(players!.response!.player!.bowl![y]);
        }
      }
    }
    setState((){});
  }

  }

  @override
  void initState() {
    //initData();
    super.initState();
    bats = List.filled(20,true);
    bowls = List.filled(20,true);
    wks = List.filled(20,true);
    alls = List.filled(20,true);
    getPlayersData();
    Future.delayed(Duration(seconds: 1),(){
     initData();
    });
  }

  Future<void> refresh() async{
    //getMatchData();
    Future.delayed(Duration(seconds: 2),(){});
  }

  changeIndex(int ind){
    setState(() {
      index = ind;
    });
  }

  //PlayersData
  List<dynamic> selectedPlayer = [];

  int playersSelected = 0;

  int maxPoints = 100;
  int teamA = 0;
  int teamB = 0;

  int wkSelected = 0;
  int batSelected = 0;
  int allSelected = 0;
  int bowlSelected = 0;


  /* 
  note type contain player category ex wk,bats,bowl,all  
    all - 0,
    bats - 1,
    all - 2,
    bowl - 3
  */
  
  void selectPlayer(PlayersData data,int type,int index,String role){

    if(playersSelected<11){

      if(teamA>=7 && data.teamId==widget.match!.teama!.teamId){

        Fluttertoast.showToast(msg: 'max 7 player allowed');

      }else if(teamB>=7 && data.teamId==widget.match!.teamb!.teamId){

        Fluttertoast.showToast(msg: 'max 7 player allowed');

      }else{

        if(playersSelected>=10 && bowlPlayer.isEmpty && type!=3){
          Fluttertoast.showToast(msg: 'min 1 bowler have to select');
        }else if(playersSelected>=10 && batPlayer.isEmpty && type!=1){
          Fluttertoast.showToast(msg: 'min 1 batsman have to select');
        }else if(playersSelected>=10 && wkPlayer.isEmpty && type!=0){
          Fluttertoast.showToast(msg: 'min 1 wicket keeper have to select');
        }else if(playersSelected>=10 && allPlayer.isEmpty && type!=2){
          Fluttertoast.showToast(msg: 'min 1 all-rounder have to select');
        }else{

          if(data.teamId==widget.match!.teama!.teamId){
            teamA++;
          }else{
            teamB++;
          }

          selectedPlayer.add(data);
          playersSelected++;
          switch (type){
            case 0: selectWk(index , data);
              break;
            case 1: selectBat(index , data);
              break;
            case 2: selectAll(index , data);
              break;
            case 3: selectBowl(index , data);
              break;
          }
          setState(() {});

        }

      }
      //   if(data.teamId==widget.match!.teama!.teamId){
      //     teamA++;
      //   }else{
      //     teamB++;
      //   }
      //   selectedPlayer.add(data);
      //   playersSelected++;
      //   switch (type){
      //     case 0: selectWk(index , data);
      //       break;
      //     case 1: selectBat(index , data);
      //       break;
      //     case 2: selectAll(index , data);
      //       break;
      //     case 3: selectBowl(index , data);
      //       break;
      //   }
      //   setState(() {});
      //}

    }else{
      Fluttertoast.showToast(msg: 'max 11 player allowed');
    }
  }

  selectWk(int index, var data){
    wks[index] = false;
    wkPlayer.add(data);
    wkSelected++;
  }

  selectBat(int index , var data){
    bats[index] = false;
    batPlayer.add(data);
    batSelected++;
  }

  selectAll(int index , var data){
    alls[index] = false;
    allPlayer.add(data);
    allSelected++;
  }

  selectBowl(int index , var data){
    bowls[index] = false;
    bowlPlayer.add(data);
    bowlSelected++;
  }

  void remove(){
    teamA = 0;
    teamB = 0;
    selectedPlayer.clear();
    bats = List.filled(20,true);
    bowls = List.filled(20,true);
    wks = List.filled(20,true);
    alls = List.filled(20,true);
    wkPlayer.clear();
    batPlayer.clear();
    bowlPlayer.clear();
    allPlayer.clear();
    playersSelected = 0;
    batSelected = 0;
    bowlSelected = 0;
    allSelected = 0;
    wkSelected = 0;
    setState(() {});
  }

  Widget selectedIndex(){
    return Container(
      height: 2,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        ),
        color: selectedIndexColor
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var playersData = Provider.of<PlayersProvider>(context).allPlayers;
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
                // Text('Demo',
                //   style: TextStyle(
                //     fontFamily: font,
                //     fontSize: 12
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      body: selectedPlayer!=null && players!=null ? Stack(
        children: [
          RefreshIndicator(
            onRefresh: refresh,
            child: playersData!=null ?  Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                               child: CachedNetworkImage(
                                 height: 40,
                                 width: 40,
                                 imageUrl: '${widget.match!.teama!.logo}',
                               ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('${widget.match!.teama!.sortName}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColor2,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 2.5
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100)
                                      ),
                                      color: Colors.black
                                    ),
                                    child: Text('$teamA',
                                      style: TextStyle(
                                        color: textColor1
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Players',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: textColor4,
                                  fontFamily: font,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text('$playersSelected/11',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textColor2,
                                  fontFamily: font,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('${widget.match!.teamb!.sortName}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColor2,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 2.5
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100)
                                      ),
                                      color: Colors.black
                                    ),
                                    child: Text('$teamB',
                                      style: TextStyle(
                                        color: textColor1
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 10,),
                              Container(
                               child: CachedNetworkImage(
                                 height: 40,
                                 width: 40,
                                 imageUrl: '${widget.match!.teamb!.logo}',
                               ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for(int x=0; x<11; x++)
                          Container(
                            padding: EdgeInsets.all(3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              gradient: selectedPlayer.length <= x ? unselectedPlayerBox : selectedPlayerBox,
                            ),
                            width: 23,
                            height: 23,
                            child: Text('${x+1}',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: selectedPlayer.length <= x ? textColor4 : textColor1
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              remove();
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: deleteButtonColor
                              ),
                              width: 23,
                              height: 23,
                              child: SvgPicture.asset(delete)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Max 7 players from one team',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: font,
                          color: textColor4
                        ),
                      )
                    ],
                  ),
                  height: height(context, 0.17),
                ),
                Consumer<PlayersProvider>(
                  builder: (context,data,child) {
                    return Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: upComingBg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                          )
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                                ),
                                color: appBgColor,
                              ),
                              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Column(
                                          children: [
                                            Text('WK($wkSelected)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: font,
                                                color: index==0 ? textColor5 : textColor4
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            if(index==0)
                                            selectedIndex()
                                          ],
                                        ),
                                        onTap: (){
                                          changeIndex(0);
                                        },
                                      ),
                                      InkWell(
                                        child: Column(
                                          children: [
                                            Text('BAT($batSelected)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: font,
                                                color: index==1 ? textColor5 : textColor4
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            if(index==1)
                                            selectedIndex()
                                          ],
                                        ),
                                        onTap: (){
                                          changeIndex(1);
                                        },
                                      ),
                                      InkWell(
                                        child: Column(
                                          children: [
                                            Text('AR($allSelected)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: font,
                                                color: index==2 ? textColor5 : textColor4
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            if(index==2)
                                            selectedIndex()
                                          ],
                                        ),
                                        onTap: (){
                                          setState(() {
                                            changeIndex(2);
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: Column(
                                          children: [
                                            Text('BOWL($bowlSelected)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: font,
                                                color: index==3 ? textColor5 : textColor4
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            if(index==3)
                                            selectedIndex()
                                          ],
                                        ),
                                        onTap: (){
                                          setState(() {
                                            changeIndex(3);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if(index==0)
                                Text('Select  $wkSelected - 4 Wicket-keeper',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor2,
                                    fontSize: 12
                                  ),
                                ),
                                if(index==1)
                                Text('Select  $batSelected - 6 Batsmen',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor2,
                                    fontSize: 12
                                  ),
                                ),
                                if(index==2)
                                Text('Select  $allSelected - 6 All-rounder',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor2,
                                    fontSize: 12
                                  ),
                                ),
                                if(index==3)
                                Text('Select  $bowlSelected - 6 Bowler',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor2,
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                                ),
                                color: appBgColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(''),
                                  Text('Selected BY',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: font,
                                      color: textColor4
                                    ),
                                  ),
                                  Text('Points',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: font,
                                      color: textColor4
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Credits',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: font,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SvgPicture.asset(downArrow)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            if(index==0)
                            Expanded(
                              child: ListView.builder(
                                itemCount: playersData.response!.player!.wk!.length,
                                itemBuilder: (cxt , index){
                                  var userid = playersData.response!.player!.wk![index];
                                  return customPlayerWidget(
                                    player: playersData.response!.player!.wk![index],
                                    buttonWidget: allPlayersId.contains(userid.pId)==false ? SvgPicture.asset(add) : Icon(Icons.minimize),
                                    isSelected: allPlayersId.contains(userid.pId)==false ? false : true,
                                    pressed: allPlayersId.contains(userid.pId)==false ? (){
                                      if(wkSelected<4){
                                        allPlayersId.add(userid.pId!);
                                        selectPlayer(playersData.response!.player!.wk![index], 0, index, 'wk');
                                      }else{
                                        Fluttertoast.showToast(msg: 'Max 4 wicket-keeper allowed');
                                      }
                                    } : (){
                                      if(widget.match!.teama!.teamId == playersData.response!.player!.wk![index].teamId){
                                        teamA--;
                                      }else{
                                        teamB--;
                                      }
                                      allPlayersId.removeWhere((element) => element==userid.pId!);
                                      playersSelected--;
                                      wkSelected--;
                                      wks[index]=true;
                                      wkPlayer.removeWhere((element) => int.parse(element.pId.toString()) == playersData.response!.player!.wk![index].pId);
                                      selectedPlayer.removeWhere((element) => int.parse(element.pId.toString()) == playersData.response!.player!.wk![index].pId);
                                      setState(() {});
                                    },
                                  );  
                              }),
                            ),
                            if(index==1)
                            Expanded(
                              child: ListView.builder(
                                itemCount: playersData.response!.player!.bat!.length,
                                itemBuilder: (cxt , index){
                                  var userid = playersData.response!.player!.bat![index];
                                  return customPlayerWidget(
                                    buttonWidget: allPlayersId.contains(userid.pId)==false ? SvgPicture.asset(add) : Icon(Icons.minimize),
                                    player: playersData.response!.player!.bat![index],
                                    isSelected: allPlayersId.contains(userid.pId)==false ? false : true,
                                    pressed: allPlayersId.contains(userid.pId)==false ? (){
                                      //selectPlayer(playersData.response!.player!.bat![index]);
                                      if(batSelected<6){
                                        allPlayersId.add(userid.pId!);
                                        selectPlayer(playersData.response!.player!.bat![index], 1, index, 'bat');
                                      }else{
                                        Fluttertoast.showToast(msg: 'Max 6 batsman allowed');
                                      }
                                    } : (){
                                      if(widget.match!.teama!.teamId == playersData.response!.player!.bat![index].teamId){
                                        teamA--;
                                      }else{
                                        teamB--;
                                      }
                                      allPlayersId.removeWhere((element) => element==userid.pId!);
                                      playersSelected--;
                                      batSelected--;
                                      bats[index]=true;
                                      batPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.bat![index].sortName);
                                      selectedPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.bat![index].sortName);
                                      setState(() {});
                                    },
                                  );  
                              }),
                            ),
                            if(index==2)
                            Expanded(
                              child: ListView.builder(
                                itemCount: playersData.response!.player!.all!.length,
                                itemBuilder: (cxt , index){
                                  var userid = playersData.response!.player!.all![index];
                                  return customPlayerWidget(
                                    player: playersData.response!.player!.all![index],
                                    buttonWidget: allPlayersId.contains(userid.pId)==false ? SvgPicture.asset(add) : Icon(Icons.minimize),
                                    isSelected: allPlayersId.contains(userid.pId)==false ? false : true,
                                    pressed: allPlayersId.contains(userid.pId)==false ? (){
                                      if(allSelected<6){
                                        allPlayersId.add(userid.pId!);
                                        selectPlayer(playersData.response!.player!.all![index], 2, index, 'all');
                                      }else{
                                        Fluttertoast.showToast(msg: 'Max 6 all-rounder allowed');
                                      }
                                    } : (){
                                      if(widget.match!.teama!.teamId == playersData.response!.player!.all![index].teamId){
                                        teamA--;
                                      }else{
                                        teamB--;
                                      }
                                      allPlayersId.removeWhere((element) => element==userid.pId!);
                                      playersSelected--;
                                      allSelected--;
                                      alls[index]=true;
                                      allPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.all![index].sortName);
                                      selectedPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.all![index].sortName);
                                      setState(() {});
                                    },
                                  );  
                              }),
                            ),
                            if(index==3)
                            Expanded(
                              child: ListView.builder(
                                itemCount: playersData.response!.player!.bowl!.length,
                                itemBuilder: (cxt , index){
                                  var userid = playersData.response!.player!.bowl![index];
                                  return customPlayerWidget(
                                    player: playersData.response!.player!.bowl![index],
                                    buttonWidget: allPlayersId.contains(userid.pId)==false ? SvgPicture.asset(add) : Icon(Icons.minimize),
                                    isSelected: allPlayersId.contains(userid.pId)==false ? false : true,
                                    pressed: allPlayersId.contains(userid.pId)==false ? (){
                                      if(bowlSelected<6){
                                        allPlayersId.add(userid.pId!);
                                        selectPlayer(userid, 3, index, 'bowl');
                                      }else{
                                        Fluttertoast.showToast(msg: 'Max 6 bowler allowed');
                                      }
                                    } : (){
                                      if(widget.match!.teama!.teamId == playersData.response!.player!.bowl![index].teamId){
                                        teamA--;
                                      }else{
                                        teamB--;
                                      }
                                      allPlayersId.removeWhere((element) => element==userid.pId!);
                                      playersSelected--;
                                      bowlSelected--;
                                      bowls[index]=true;
                                      bowlPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.bowl![index].sortName);
                                      selectedPlayer.removeWhere((element) => element.sortName == playersData.response!.player!.bowl![index].sortName);
                                      setState(() {});
                                    },
                                  );  
                              }),
                            ),
                            SizedBox(height: 50,)
                          ],
                        ),
                      ),
                    );
                  }
                )
              ],
            ) : Center(
              child: CircularProgressIndicator(),
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => 
                        PreviewTeam(
                          wk: wkPlayer,
                          bats: batPlayer,
                          bowls: bowlPlayer,
                          all: allPlayer,
                          selectedTeam: selectedPlayer,
                          match: widget.match!,
                          captain: 0,
                          viceCaptain: 0,
                          teamA: teamA.toInt(),
                          teamB: teamB.toInt(),
                        )));
                      },
                      child: Container(
                        width: width(context, 0.45),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: buttonBgColor4
                        ),
                        child: Text('Team Preview',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: font,
                            color: textColor1 
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: selectedPlayer.length==11 ? (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (ctx) => 
                            CreateCaptain(
                              wk: wkPlayer,
                              bowls: bowlPlayer,
                              selectedTeam: selectedPlayer,
                              bats: batPlayer,
                              all: allPlayer,
                              match: widget.match!,
                              teamA: teamA,
                              teamB: teamB,
                              c: widget.captainUpdate == true ? widget.captain : 0,
                              vc: widget.captainUpdate == true ? widget.viceCaptain : 0,
                              update: widget.captainUpdate == true ? true : false,
                              teamId: widget.teamId
                            )
                          )
                        );
                      } : null,
                      child: Container(
                        width: width(context, 0.45),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: selectedPlayer.length==11 ?  buttonBgColor : buttonBgColor5
                        ),
                        child: Text('Continue',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: font,
                            color: selectedPlayer.length==11 ? textColor1 : textColor4
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}

class customPlayerWidget extends StatelessWidget {
  customPlayerWidget({
    this.player,
    this.buttonWidget,
    this.pressed,
    this.isSelected
  });

  Widget? buttonWidget;
  Function()? pressed;
  PlayersData? player;
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: pressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: isSelected==true ? borderColor2 : borderColor
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              ),
              color: appBgColor
            ),
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: player!.playerImage == null ? 
                      Image.asset(playerProfile,
                        height: 45,
                      ) : 
                      CachedNetworkImage(imageUrl: player!.playerImage!),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: (width(context, 0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${player!.sortName}',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              color: textColor2
                            ),
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Text('${player!.teamName}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: font,
                                  color: textColor2
                                ),
                              ),
                              Text(' | ${player!.analytics!.selection!} %',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: font,
                                  color: textColor4
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('${player!.points}',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: font,
                    color: textColor4
                  ),
                ),
                Row(
                  children: [
                    Text('${player!.fantasyPlayerRating}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: font,
                        color: textColor2
                      ),
                    ),
                    SizedBox(width: 10,),
                    buttonWidget!
                    // InkWell(
                    //   onTap: pressed,
                    //   child: buttonWidget,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}