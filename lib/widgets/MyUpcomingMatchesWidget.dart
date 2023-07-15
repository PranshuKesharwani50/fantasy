// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/widgets/timer.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../Models/MyContestModel.dart';

class MyUpComingMatchesWidget extends StatelessWidget {
  MyUpComingMatchesWidget({
    this.myContests
  });

  MatchModel? myContests;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (ctx)=> joinTeam(match: data)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
        elevation: 0.4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //'Upcoming Match',
                    '${myContests!.leageTitle}',
                    // "${joinedmatchdata[index].leagueTitle ?? ""}",
                    style: TextStyle(
                      fontFamily: font,
                      color: textColor4,
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                top: 10,
                left: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          height: 40,
                          width: 40,
                          imageUrl: '${myContests!.teama!.logo}',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('${myContests!.teama!.sortName}',
                        style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //TimerWidget(mydurStart: myContests!.timeStampStart!,mydurEnd: myContests!.timeStampEnd!,startingTime: myContests!.dateStart!,)
                    ],
                  ),
                  Row(
                    children: [
                      Text('${myContests!.teamb!.sortName}',
                        style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: CachedNetworkImage(
                          height: 40,
                          width: 40,
                          imageUrl: '${myContests!.teamb!.logo}',
                        ),
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
                  Container(
                    width: width(context, 0.3),
                    child: Text('${myContests!.teama!.name}',
                      style: TextStyle(
                        fontFamily: font
                      ),
                    )
                  ),
                  //if(myContests!.isLineUp==true)
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 3
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2)
                      ),
                      color: Colors.green.withOpacity(0.4)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(online),
                        SizedBox(width: 1,),
                        Text('Lineups Out',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: font,
                            color: textColor3
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: width(context, 0.3),
                    child: Text('${myContests!.teamb!.name}',
                      style: TextStyle(
                        fontFamily: font
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Divider(
              thickness: 1,
              height: 0.5,
              color: dividerColor1,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: upcomingmatchCardBottomBg,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${myContests!.totalJoinContest} Contests Joined | ${myContests!.totalJoinContest} Team',
                    style: TextStyle(
                      color: textColor4,
                      fontFamily: font
                    )
                  ),
                  Row(
                    children: [
                      Text('YOU WON ',
                        style: TextStyle(
                          color: textColor3,
                          fontFamily: font
                        )
                      ),
                      Image.asset(coin,height: 15,),
                      Text(' ${myContests!.prizeAmt}',
                        style: TextStyle(
                          color: textColor3,
                          fontFamily: font
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}