// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';

import '../Models/MathesModel.dart';

class PreviewTeam extends StatefulWidget {
  PreviewTeam({
    required this.selectedTeam,
    required this.match,
    required this.wk,
    required this.bats,
    required this.all,
    required this.bowls,
    required this.captain,
    required this.viceCaptain,
    required this.teamA,
    required this.teamB,
  });

  var selectedTeam = [];
  var wk = [];
  var bats = [];
  var all = [];
  var bowls = [];
  upcomingMatchData match;
  int? captain;
  int? viceCaptain;
  int? teamA;
  int? teamB;

  @override
  State<PreviewTeam> createState() => _PreviewTeamState();
}

class _PreviewTeamState extends State<PreviewTeam> {

  @override
  void initState() {
    print(widget.viceCaptain);
    print(widget.captain);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(teamPreviewBG),
                  fit: BoxFit.fill
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WICKET KEEPER',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      color: textColor1
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int x=0; x<widget.wk.length; x++)
                      customPreviewWidget(widget.wk[x], widget.captain, widget.viceCaptain)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text('BATSMEN',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      color: textColor1
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int x=0; x<widget.bats.length; x++)
                      customPreviewWidget(widget.bats[x], widget.captain, widget.viceCaptain)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text('ALL ROUNDERS',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      color: textColor1
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int x=0; x<widget.all.length; x++)
                      customPreviewWidget(widget.all[x], widget.captain, widget.viceCaptain)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text('BOWLER',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      color: textColor1
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int x=0; x<widget.bowls.length; x++)
                      customPreviewWidget(widget.bowls[x], widget.captain, widget.viceCaptain)
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black.withOpacity(0.50),
                  width: double.infinity,
                  height: height(context, 0.11),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(cancel),
                          ),
                          SizedBox(width: 10,),
                          Text('Team',
                            style: TextStyle(
                              fontFamily: font,
                              color: textColor1,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5
                            ),
                            decoration: BoxDecoration(
                              color: appBgColor2,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5)
                              ),
                            ),
                            child: Row(
                              children: [
                                Text('${widget.match.teama!.sortName}',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                ),
                                SizedBox(width: 5,),
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
                                  child: Text('${widget.teamA}',
                                    style: TextStyle(
                                      color: textColor2
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Players',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 11
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('${widget.selectedTeam.length}/11',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 11
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Credits Left',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 11
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('2.5',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 11
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5
                            ),
                            decoration: BoxDecoration(
                              color: appBgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5)
                              ),
                            ),
                            child: Row(
                              children: [
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
                                  child: Text('${widget.teamB}',
                                    style: TextStyle(
                                      color: textColor1
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text('${widget.match.teamb!.sortName}',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  Widget customPreviewWidget(var player, int? cId, int? vcId){

    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(playerProfile,height: 50,),
              //SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: widget.match.teama!.teamId==player.teamId ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5)
                  )
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  '${player.sortName}',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: font,
                    color: widget.match.teama!.teamId==player.teamId ? textColor1 : textColor2
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${player.fantasyPlayerRating}',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: font,
                  color: textColor1
                ),
              ),
            ],
          ),
          if(int.parse(player.pId.toString())==cId || int.parse(player.pId.toString())==vcId)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: int.parse(player.pId.toString())==cId ? 7 : 3.5,
                vertical: 4
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100)
                ),
                color: int.parse(player.pId.toString())==cId ? buttonBgColor : buttonBgColor2
              ),
              child: Text(int.parse(player.pId.toString())==cId ? 'C' : 'VC',
                style: TextStyle(
                  color: textColor1,
                  fontSize: 11
                ),
              ),
            )
          )
        ],
      ),
    );

  }
}