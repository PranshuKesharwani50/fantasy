// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, unused_import, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Screens/PreviewTeam.dart';
import 'package:playon69/apis/apis.dart';

import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../Models/MathesModel.dart';
import '../Models/playersModel.dart';
import '../apis/callApi.dart';
import '../apis/sharedPreference.dart';
import '../widgets/timer.dart';

class CreateCaptain extends StatefulWidget {
  CreateCaptain({
    this.selectedTeam,
    required this.match,
    this.wk,
    this.bats,
    this.all,
    this.bowls,
    this.teamA,
    this.teamB,
    this.update,
    this.c,
    this.vc,
    this.teamId,
  });

  upcomingMatchData match;
  //PlayersData
  List<dynamic>? selectedTeam;
  List<dynamic>? wk = [];
  List<dynamic>? bats = [];
  List<dynamic>? all = [];
  List<dynamic>? bowls = [];
  int? teamA;
  int? teamB;
  bool? update = false;
  int? c;
  int? vc;
  int? teamId;

  @override
  State<CreateCaptain> createState() => _CreateCaptainState();
}

class _CreateCaptainState extends State<CreateCaptain> {

  // List<bool> Vcbats = [];
  // List<bool> Vcbowls = [];
  // List<bool> Vcalls = [];
  // List<bool> Vcwks = [];
  // List<bool> Cbats = [];
  // List<bool> Cbowls = [];
  // List<bool> Calls = [];
  // List<bool> Cwks = [];

  @override
  void initState() {
    initData();
    // Vcbats = List.filled(widget.bats.length,true);
    // Vcbowls = List.filled(widget.bowls.length,true);
    // Vcwks = List.filled(widget.wk.length,true);
    // Vcalls = List.filled(widget.all.length,true);
    // Cbats = List.filled(widget.bats.length,true);
    // Cbowls = List.filled(widget.bowls.length,true);
    // Cwks = List.filled(widget.wk.length,true);
    // Calls = List.filled(widget.all.length,true);
    super.initState();
  }

  void initData(){
    if(widget.update==true){
      teamId = widget.teamId;
      captainId = widget.c;
      viceCaptainId = widget.vc;
    }

  }

  int? teamId;

  int? captainId;
  int? viceCaptainId;

  int captains = 0;
  int vicecaptains = 0; 

  int? curCapIndex;
  int? curViceCapIndex;

  // void clearCaptains(){
  //   captainId = 0;
  //   Cbats = List.filled(widget.bats.length,true);
  //   Cbowls = List.filled(widget.bowls.length,true);
  //   Cwks = List.filled(widget.wk.length,true);
  //   Calls = List.filled(widget.all.length,true);
  // }

  // void clearVCaptains(){
  //   viceCaptainId = 0;
  //   Vcbats = List.filled(widget.bats.length,true);
  //   Vcbowls = List.filled(widget.bowls.length,true);
  //   Vcwks = List.filled(widget.wk.length,true);
  //   Vcalls = List.filled(widget.all.length,true);
  // }

  List<int> playesIDs = [];

  getMatchData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    getMatchDataById1(context, res['token'], '${widget.match.matchId!}', res['user_data']['user_name']);
    getMyTeam1(context, res['token'], '${widget.match.matchId!}', res['user_data']['user_name']);  
  }

  void saveTeam() async{

    widget.selectedTeam!.forEach((element) {
      playesIDs.add(int.parse(element.pId!.toString()));
    });

    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    print(res['user_data']['user_name']);
    var matchId = widget.match.matchId!.toInt();
    String userId = res['user_data']['user_name'];
    

    var data = {
      'match_id':matchId,  //'62826',
      'user_id':"$userId", //'JLZI3BJO'
      'contest_id':"",
      'team_id':[widget.match.teama!.teamId,widget.match.teamb!.teamId],
      //"teams":[1,2,3,4,5,6,7,8,9,10,11],
      'teams':playesIDs,
      'captain':captainId,
      'vice_captain':viceCaptainId,
      'created_team_id':teamId
    };

    var responce = await createTeam(res['token'], data);
    if(responce['code']==200){
      getMatchData();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }else{
      Fluttertoast.showToast(msg: '${responce['message']}');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
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
                Text('${widget.match.teama!.sortName} vs ${widget.match.teamb!.sortName}',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 2,),
                TimerWidget(mydurStart: widget.match.timeStampStart!,mydurEnd: widget.match.timeStampEnd!,startingTime: widget.match.dateStart!,),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: appBgColor,
                height: height(context, 0.17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Choose your Captain and Vice Captain',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 16,
                        color: textColor2,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            ),
                            color: upComingBg
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(c),
                              SizedBox(width: 5,),
                              Text('Get 2x Points',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 12,
                                  color: textColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            ),
                            color: upComingBg
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(vc),
                              SizedBox(width: 5,),
                              Text('Get 1.5x Points',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 12,
                                  color: textColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,right: 15,left: 15),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: upComingBg,
                            width: 1
                          )
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width(context, 0.38),
                            child: Text('Players',
                              style: TextStyle(
                                fontFamily: font,
                                fontSize: 12,
                                color: textColor4,
                              ),
                            ),
                          ),
                          Text('Points',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 12,
                              color: textColor4,
                            ),
                          ),
                          Text('%C',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 12,
                              color: textColor4,
                            ),
                          ),
                          Text('%VC',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 12,
                              color: textColor4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: upComingBg,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomCaptainTile('Wicket-Keeper',widget.wk!,),
                        SizedBox(height: 10,),
                        CustomCaptainTile('Batsman',widget.bats!,),
                        SizedBox(height: 10,),
                        CustomCaptainTile('All-Rounder',widget.all!,),
                        SizedBox(height: 10,),
                        CustomCaptainTile('Bowler',widget.bowls!,)
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(
                height: 52,
              )
            ],
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
                            wk: widget.wk!,
                            bats: widget.bats!,
                            bowls: widget.bowls!,
                            all: widget.all!,
                            selectedTeam: widget.selectedTeam!,
                            match: widget.match,
                            captain: captainId,
                            viceCaptain: viceCaptainId,
                            teamA: widget.teamA,
                            teamB: widget.teamB,
                          )
                        ));
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
                      onTap: viceCaptainId!=0 && captainId!=0 ? (){
                        saveTeam();
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
                          color: viceCaptainId!=0 && captainId!=0 ? buttonBgColor : buttonBgColor5
                        ),
                        child: Text('Save Team',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: font,
                            color: viceCaptainId!=0 && captainId!=0 ? textColor1 : textColor4
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
      ),
    );
  }

  Widget CustomCaptainTile(String title,List<dynamic> players){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        ),
        color: appBgColor
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(headingBg,),
                fit: BoxFit.fill
              )
            ),
            child: Text('$title',
              style: TextStyle(
                fontFamily: font,
                fontSize: 14,
                color: textColor2,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          for(int x=0; x<players.length; x++)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: upComingBg
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width(context, 0.5),
                  child: Row(
                    children: [
                      Image.asset(playerProfile,height: 50,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${players[x].sortName}',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 13,
                              color: textColor2,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5,),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     vertical: 1,
                          //     horizontal: 3
                          //   ),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: appBarColor,
                          //       width: 0.1
                          //     ),
                          //     borderRadius: BorderRadius.all(
                          //       Radius.circular(10)
                          //     )
                          //   ),
                          //   child: Text('${players[x].name}',
                          //     style: TextStyle(
                          //       fontFamily: font,
                          //       fontSize: 10,
                          //       color: textColor2,
                          //       fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${players[x].points}',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 13,
                          color: textColor4,
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: int.parse(players[x].pId!.toString())!=captainId && int.parse(players[x].pId!.toString())!=viceCaptainId ?  (){
                              captainId = int.parse(players[x].pId!.toString());
                              setState(() {});
                            } : (){
                              captainId = 0;
                              setState(() {});
                            },
                            child: int.parse(players[x].pId!.toString())==captainId ? SvgPicture.asset(c) : SvgPicture.asset(cc1)
                          ),
                          // Text('${double.parse(players[x].analytics!.captain!).toStringAsFixed(00)} %',
                          //   style: TextStyle(
                          //     fontFamily: font,
                          //     fontSize: 10,
                          //     color: textColor4
                          //   ),
                          // ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: int.parse(players[x].pId!.toString())!=viceCaptainId && int.parse(players[x].pId!.toString())!=captainId ?  (){
                              viceCaptainId = int.parse(players[x].pId!.toString());
                              setState(() {});
                            } : (){
                              viceCaptainId = 0;
                              setState(() {});
                            },
                            //child: vvalue[x]==true ? SvgPicture.asset(vcc1) : SvgPicture.asset(vc)
                            child: int.parse(players[x].pId!.toString())==viceCaptainId ? SvgPicture.asset(vc) : SvgPicture.asset(vcc1),
                          ),
                          // Text('${double.parse(players[x].analytics!.viceCaptain!).toStringAsFixed(00)} %',
                          //   style: TextStyle(
                          //     fontFamily: font,
                          //     fontSize: 10,
                          //     color: textColor4,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}