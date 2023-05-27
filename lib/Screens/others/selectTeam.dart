// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, use_build_context_synchronously, unused_import, prefer_is_empty, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Models/MatchContest.dart';
import 'package:playon69/Models/availableTeamModel.dart';
import 'package:playon69/Providers/newContestStatusProvider.dart';
import 'package:playon69/apis/apis.dart';
import 'package:provider/provider.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';
import '../../Models/MathesModel.dart';
import '../../Models/myTeamModel.dart';
import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';
import '../createTeam.dart';

class SelectTeam extends StatefulWidget {
  SelectTeam({
    this.contestId,
    this.maxTeamAllowed,
    this.useableBonus,
    this.match,
    this.entryFee
    //this.contest
  });

  int? entryFee;
  int? contestId;
  int? maxTeamAllowed;
  int? useableBonus;
  //contestsData? contest;
  upcomingMatchData? match;

  @override
  State<SelectTeam> createState() => _SelectTeamState();
}

class _SelectTeamState extends State<SelectTeam> {

  AvailableTeamModel? teams;

  getAvailableTeams() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    teams = await getNewContestStatus1(context, res['token'], '${widget.match!.matchId!}', widget.contestId!, res['user_data']['user_name']);
    setState(() {});
  }

  getMatchData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    getMyTeam1(context, res['token'], '${widget.match!.matchId!}', res['user_data']['user_name']);  
  }

  List<bool> selected = [];
  int currentTeam = 0;

  @override
  void initState() {
    selected = List.filled(20, false);
    super.initState();
    getAvailableTeams();
  }

  Future<void> refresh() async{
    getAvailableTeams();
    Future.delayed(Duration(seconds: 3),(){});
  }

  List<int> selectedTeam = [];

  // join() async{
  //   var res = await retrivePref(method: methods.Maps, key: 'currentUser');
  //   var responce = await joinContest(res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], widget.contestId!, selectedTeam);
  //   print('join : $responce');
  //   if(responce['code']==200){
  //     getMatchData();
  //     Fluttertoast.showToast(msg: responce['message']);
  //     Navigator.of(context).pop();
  //   }else{
  //     Fluttertoast.showToast(msg: responce['message']);
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {

    var team = Provider.of<NewContestStatusProvider>(context).teams;

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
                Text('Demo',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 12
                  ),
                ),
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
      body: teams!=null ? RefreshIndicator(
        onRefresh: refresh,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Consumer<NewContestStatusProvider>(
            builder: (context , data ,child) {
              return team!.teamList!=null ? ListView(
                children: [
                  for(int x=0; x < team.teamList![0].openTeam!.length; x++)
                  Column(
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
                              //padding: EdgeInsets.all(10),
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
                                children: [
                                  if(widget.maxTeamAllowed==1)
                                  Checkbox(
                                    value: currentTeam==team.teamList![0].openTeam![x].createdTeam!.team_Id! ? true : false, 
                                    onChanged: (value){
                                      if(currentTeam!=team.teamList![0].openTeam![x].createdTeam!.team_Id!){
                                        selectedTeam.clear();
                                        selectedTeam.add(team.teamList![0].openTeam![x].createdTeam!.team_Id!);
                                        currentTeam = team.teamList![0].openTeam![x].createdTeam!.team_Id!;
                                        setState(() {});
                                      }else{
                                        selectedTeam.clear();
                                        currentTeam = 0;
                                        setState(() {});
                                      }
                                    }
                                  ),
                                  if(widget.maxTeamAllowed! > 1)
                                  Checkbox(
                                    value: selected[x], 
                                    onChanged: (value){
                                      if(selected[x]==false){
                                        if(selectedTeam.length < widget.maxTeamAllowed!){
                                            selectedTeam.add(team.teamList![0].openTeam![x].createdTeam!.team_Id!);
                                            setState(() {
                                              selected[x]=value!;
                                            });
                                          }else{
                                            Fluttertoast.showToast(msg: 'You reach maximum no of team selection for contest');
                                          }
                                        }else{
                                          selectedTeam.removeWhere((element) => element==team.teamList![0].openTeam![x].createdTeam!.team_Id!);
                                          setState(() {
                                            selected[x]=value!;
                                          });
                                      }
                                    }
                                  ),
                                  Text('Team',
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
                                            imageUrl: team.teamList![0].openTeam![x].cImage!,
                                            height: 50,
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            width: width(context, 0.2),
                                            child: Text('${team.teamList![0].openTeam![x].captain!.name}',
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
                                      Text('${team.teamList![0].openTeam![x].teams![0].name}',
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
                                        child: Text('${team.teamList![0].openTeam![x].teams![0].count}',
                                          style: TextStyle(
                                            color: textColor2
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('${team.teamList![0].openTeam![x].teams![1].name}',
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
                                        child: Text('${team.teamList![0].openTeam![x].teams![1].count}',
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
                                            imageUrl: team.teamList![0].openTeam![x].vcImage!,
                                            height: 50,
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            width: width(context, 0.2),
                                            child: Text('${team.teamList![0].openTeam![x].viceCaptain!.name}',
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
                                  Text('WK(${team.teamList![0].openTeam![x].wks!.length})',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 14,
                                      color: textColor1,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('BAT(${team.teamList![0].openTeam![x].bats!.length})',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 14,
                                      color: textColor1,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('AR(${team.teamList![0].openTeam![x].all!.length})',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 14,
                                      color: textColor1,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('BOWL(${team.teamList![0].openTeam![x].bowls!.length})',
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
                  ),
                ],
              ) : Center(
                child: Text('No Team Found!',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 15
                  ),
                ),
              );
            }
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
            },
            child: Container(
              height: height(context, 0.06),
              width: width(context, 0.45),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15
              ),
              //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                ),
                color: buttonBgColor
              ),
              child: Text('Create Team',
                style: TextStyle(
                  fontFamily: font,
                  color: textColor1
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              //join();
              joinContestDailog(
                context,
                widget.entryFee!,
                widget.useableBonus!=null ? widget.useableBonus! : 0,
                selectedTeam,
                widget.match,
                widget.contestId
              );
            },
            child: Container(
              height: height(context, 0.06),
              width: width(context, 0.45),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                ),
                color: buttonBgColor4
              ),
              child: Text('Join Contest',
                style: TextStyle(
                  fontFamily: font,
                  color: textColor1
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}