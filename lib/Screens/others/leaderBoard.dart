// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/apis/callApi.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';
import '../../Models/MatchContest.dart';
import '../../Models/MathesModel.dart';
import '../../Models/leaderBoardModel.dart';
import '../../apis/apis.dart';
import '../../apis/sharedPreference.dart';
import '../../customs/CustomButton.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({
    this.match,
    this.contest,
    this.contestId
  });

  upcomingMatchData? match;
  myJoinedContest? contest;
  int? contestId;

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  int index = 0;  

  Widget selectedIndex(){
    return Container(
      height: 2,
      width: width(context, 0.25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        ),
        color: selectedIndexColor
      ),
    );
  }

  changeIndex(int ind){
    setState(() {
      index = ind;
    });
  }

  PriceBreakupModel? priceBreakup;
  LeaderBoardModel? leaderBoard;

  void getDatas() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    priceBreakup = await getPriceBreakUp1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], widget.contest!.contestId!);
    leaderBoard = await getLeaderBoard1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], widget.contest!.contestId!);
    if(priceBreakup!.status==true && leaderBoard!.status==true){
      setState(() {});
    }
  }

  @override
  void initState() {
    getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                // TimerWidget(mydur: data==null ? 0 : data.matchTime!),
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
      body: leaderBoard!=null && priceBreakup!=null ? Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            //height: height(context , 0.15),
            child: Container(
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
                                Text('₹${widget.contest!.firstPrice}',
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
                              Text('Winners : ${widget.contest!.winnerCount}',
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
                              //onTap: (){
                                // joinContest(widget.contest!.contestId);
                                // getAvailableTeams(contest.contestId!);
                                // joinContestBottomSheet();
                                // if(teamLenght==0){
                                //   Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
                                // }else if(teamLenght==1){
                                //   joinContestDailog(
                                //     context, 
                                //     contest.entryFees!, 
                                //     contest.usableBonus!=null ? contest.usableBonus! : 0, 
                                //     [teamId], 
                                //     widget.match, 
                                //     contest.contestId
                                //   );
                                // }else{
                                //   Navigator.push(
                                //   context, MaterialPageRoute(
                                //     builder: (ctx) => SelectTeam(
                                //       match: widget.match,
                                //       maxTeamAllowed: contest.maxTeamAllowed,
                                //       useableBonus: contest.usableBonus,
                                //       contestId: contest.contestId,
                                //       entryFee: contest.entryFees,
                                //       //contest: contest,
                                //       )
                                //     )
                                //   );
                                // }
                              //},
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3)
                                  ),
                                  color: buttonBgColor5
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(coin,height: 12,),
                                    SizedBox(width: 3,),
                                    Text('₹${widget.contest!.entryFee}',
                                      style: TextStyle(
                                        color: textColor4,
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
                          value: (widget.contest!.filledSpots! * 100 / widget.contest!.totalSpots!) /100 ,
                          //value: 0.7,
                          color: progressColor,
                          backgroundColor: unProgressColor,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${widget.contest!.totalSpots! - widget.contest!.filledSpots!} Left',
                              style: TextStyle(
                                color: textColor5,
                                fontFamily: font,
                                fontSize: 12
                              )
                            ),
                            Text('${widget.contest!.totalSpots} Spots',
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
                            Text('₹${widget.contest!.totalWinningPrice}',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                            SizedBox(width: 20,),
                            SvgPicture.asset(winPer),
                            SizedBox(width: 5,),
                            Text('${widget.contest!.winningPercentage} %',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                            SizedBox(width: 20,),
                            SvgPicture.asset(m2),
                            SizedBox(width: 5,),
                            Text('Upto ${widget.contest!.maxTeamAllowed}',
                              style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 11
                                  )
                            ),
                          ],
                        ),
                        if(widget.contest!.cancellation==false)
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomButton(
                      label: 'Join Contest', 
                      padding: EdgeInsets.all(10), 
                      borderRadius: 5, 
                      widget: Container(), 
                      mainAlignment: MainAxisAlignment.center, 
                      onTap: (){}, 
                      borderColor: borderColor, 
                      borderWidth: 0,
                      color: buttonBgColor4,
                      fontColor: textColor1,
                      fontFamily: font,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              child: Column(
                children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)
                      ),
                      color: appBgColor,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              Text('Winning Breakup',
                                style: TextStyle(
                                  fontSize: 14,
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
                              Text('Leaderboard',
                                style: TextStyle(
                                  fontSize: 14,
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
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: borderColor5
                        ) 
                      ),
                      color: appBgColor,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('All Teams (${leaderBoard!.leaderboard!.length})',
                          style: TextStyle(
                            color: textColor4,
                            fontSize: 13,
                            fontFamily: font
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(index==0)
                  Expanded(
                    child: ListView(
                      children: [
                        for(int x=0; x<leaderBoard!.leaderboard!.length; x++)
                        Container(
                          decoration: BoxDecoration(
                            color: appBgColor,
                            border: Border(
                              bottom: BorderSide(
                                color: borderColor5
                              )
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('# ${priceBreakup!.response!.priceBreakup![x].rank}',
                                style: TextStyle(
                                  color: textColor4,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(coin),
                                  SizedBox(width: 2,),
                                  Text('${priceBreakup!.response!.priceBreakup![x].price}',
                                    style: TextStyle(
                                      color: textColor2,
                                      fontSize: 12,
                                      fontFamily: font
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  if(index==1)
                  Expanded(
                    child: ListView(
                      children: [
                        for(int x=0; x<leaderBoard!.leaderboard!.length; x++)
                        Container(
                          decoration: BoxDecoration(
                            color: appBgColor,
                            border: Border(
                              bottom: BorderSide(
                                color: borderColor5
                              )
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(playerProfile,height: 20,),
                              SizedBox(width: 10,),
                              Text('${leaderBoard!.leaderboard![x].user!.userName}',
                                style: TextStyle(
                                  color: textColor2,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              ),
                              Text(' (${leaderBoard!.leaderboard![x].team})',
                                style: TextStyle(
                                  color: textColor2,
                                  fontSize: 12,
                                  fontFamily: font
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}