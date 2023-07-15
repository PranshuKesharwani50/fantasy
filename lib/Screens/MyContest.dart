
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Screens/others/completeMatch.dart';
import 'package:playon69/Screens/others/liveMatch.dart';

import '../Models/MyContestModel.dart';
import '../customs/CustomButton.dart';
import 'others/upComingMatch.dart';

class MyContest extends StatefulWidget {
  const MyContest({super.key});

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {

  int index = 0;
  MyContestModel? myContests;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //matchHistory();
  }

  // void matchHistory() async{
  //   var res = await retrivePref(method: methods.Maps, key: 'currentUser');
  //   String token = res['token'];
  //   String userId = res['user_data']['user_name'];
  //   myContests = await getMyContestHistory1(context, '4112|jnxLaeqCSzKXRstroV5SfnUCkX4RRwwF1UhzPQk5', userId);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: isLoading == false ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5)
                  ),
                  color: upComingBg,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      color: index==0 ? buttonBgColor : upComingBg,
                      label: 'Upcoming',
                      fontColor: index==0 ? textColor1 : textColor4,
                      fontFamily: font, 
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: width(context, 0.05)), 
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
                      label: 'Live',
                      fontColor: index==1 ? textColor1 : textColor4,
                      fontFamily: font, 
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: width(context, 0.05)), 
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
                      label: 'Completed',
                      fontColor: index==2 ? textColor1 : textColor4,
                      fontFamily: font, 
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: width(context, 0.05)), 
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
            ),
            if(index == 0)
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: upComingBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: UpComingMatches()
              ),
            ),
            if(index == 1)
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: upComingBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: liveMatch()
              ),
            ),
            if(index == 2)
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: upComingBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: CompleteMatch()
              ),
            ),
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }

  // Widget upcominMatchWidget(List<gameHistoryModel>? match,int index){
  //   var data = match![index];
  //   // print(data!.length);
  //   return InkWell(
  //     onTap: (){
  //       //Navigator.push(context, MaterialPageRoute(builder: (ctx)=> joinTeam(match: data)));
  //     },
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(10)
  //         )
  //       ),
  //       elevation: 0.4,
  //       // child: Column(
  //       //   children: [
  //       //     Padding(
  //       //       padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
  //       //       child: Row(
  //       //         mainAxisAlignment: MainAxisAlignment.center,
  //       //         children: [
  //       //           Text(
  //       //             //'Upcoming Match',
  //       //             '${data.leageTitle}',
  //       //             // "${joinedmatchdata[index].leagueTitle ?? ""}",
  //       //             style: TextStyle(
  //       //               fontFamily: font,
  //       //               color: textColor4,
  //       //               fontSize: 12
  //       //             ),
  //       //           ),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //     Padding(
  //       //       padding: const EdgeInsets.only(
  //       //         right: 10,
  //       //         top: 10,
  //       //         left: 10
  //       //       ),
  //       //       child: Row(
  //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //         children: [
  //       //           Row(
  //       //             children: [
  //       //               Container(
  //       //                 child: CachedNetworkImage(
  //       //                   height: 40,
  //       //                   width: 40,
  //       //                   imageUrl: '${data.teama!.logo}',
  //       //                 ),
  //       //               ),
  //       //               SizedBox(width: 10),
  //       //               Text('${data.teama!.sortName}',
  //       //                 style: TextStyle(
  //       //                   fontFamily: font,
  //       //                   fontWeight: FontWeight.bold
  //       //                 ),
  //       //               ),
  //       //             ],
  //       //           ),
  //       //           Column(
  //       //             children: [
  //       //               TimerWidget(mydurStart: data.timeStampStart!,mydurEnd: data.timeStampEnd!,startingTime: data.dateStart!,)
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             children: [
  //       //               Text('${data.teamb!.sortName}',
  //       //                 style: TextStyle(
  //       //                   fontFamily: font,
  //       //                   fontWeight: FontWeight.bold
  //       //                 ),
  //       //               ),
  //       //               SizedBox(width: 10),
  //       //               Container(
  //       //                 child: CachedNetworkImage(
  //       //                   height: 40,
  //       //                   width: 40,
  //       //                   imageUrl: '${data.teamb!.logo}',
  //       //                 ),
  //       //               ),
  //       //             ],
  //       //           ),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //     Padding(
  //       //       padding: EdgeInsets.all(10),
  //       //       child: Row(
  //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //         children: [
  //       //           Container(
  //       //             width: width(context, 0.3),
  //       //             child: Text('${data.teama!.name}',
  //       //               style: TextStyle(
  //       //                 fontFamily: font
  //       //               ),
  //       //             )
  //       //           ),
  //       //           if(data.isLineUp==true)
  //       //           Container(
  //       //             padding: EdgeInsets.symmetric(
  //       //               vertical: 2,
  //       //               horizontal: 3
  //       //             ),
  //       //             decoration: BoxDecoration(
  //       //               borderRadius: BorderRadius.all(
  //       //                 Radius.circular(2)
  //       //               ),
  //       //               color: Colors.green.withOpacity(0.4)
  //       //             ),
  //       //             child: Row(
  //       //               children: [
  //       //                 SvgPicture.asset(online),
  //       //                 SizedBox(width: 1,),
  //       //                 Text('Lineups Out',
  //       //                   style: TextStyle(
  //       //                     fontSize: 11,
  //       //                     fontFamily: font,
  //       //                     color: textColor3
  //       //                   ),
  //       //                 ),
  //       //               ],
  //       //             ),
  //       //           ),
  //       //           Container(
  //       //             alignment: Alignment.topRight,
  //       //             width: width(context, 0.3),
  //       //             child: Text('${data.teamb!.name}',
  //       //               style: TextStyle(
  //       //                 fontFamily: font
  //       //               ),
  //       //             )
  //       //           ),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //     if(data.eventName!=null)
  //       //     Divider(
  //       //       thickness: 1,
  //       //       height: 0.5,
  //       //       color: dividerColor1,
  //       //     ),
  //       //     if(data.eventName!=null)
  //       //     Container(
  //       //       padding: EdgeInsets.all(10),
  //       //       decoration: BoxDecoration(
  //       //         color: upcomingmatchCardBottomBg,
  //       //         borderRadius: BorderRadius.only(
  //       //           bottomLeft: Radius.circular(10),
  //       //           bottomRight: Radius.circular(10)
  //       //         )
  //       //       ),
  //       //       child: Row(
  //       //         children: [
  //       //           SvgPicture.asset(M),
  //       //           SizedBox(width: 5,),
  //       //           Text('1st price win ₹${data.eventName}',
  //       //             style: TextStyle(
  //       //               color: textColor3
  //       //             )
  //       //           )
  //       //         ],
  //       //       ),
  //       //     ),
  //       //   ],
  //       // ),
  //       child: Text('Demo'),
  //     ),
  //   );
  // }

}