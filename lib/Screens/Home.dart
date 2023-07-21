// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import, use_build_context_synchronously

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/MathesModel.dart';
import 'package:playon69/Providers/MathesProvider.dart';
import 'package:playon69/Screens/DrawerScreen/Wallet.dart';
import 'package:playon69/Screens/joinContest.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/callApi.dart';
import 'package:playon69/widgets/timer.dart';
import 'package:provider/provider.dart';

import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../apis/sharedPreference.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  MatchesModel? match;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    String token = res['token'];
    var data = await getMatches1(context, token);
    if(data.status==true){
      setState(() {
        match = data;
      });
    }
  }

  Future<void> refresh() async{
    getData();
    Future.delayed(Duration(seconds: 2),(){});
  }

  List<String> images = [
    banner1,
    banner1
  ];

  @override
  Widget build(BuildContext context) {
    //var match = Provider.of<MatchesProvider>(context).matches;
    var banner = Provider.of<MatchesProvider>(context).banners;
    //print(matches!.responce!.matchData![1].upComingMatches![0].title);
    return Scaffold(
      backgroundColor: appBgColor,
      body: match!=null ?  RefreshIndicator(
        onRefresh: refresh,
        displacement: 30.0,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: Consumer<MatchesProvider>(
          builder: (context,data,child) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: height(context , 0.15),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        clipBehavior: Clip.hardEdge,
                        pageSnapping: true,
                        enlargeCenterPage: true,
                        //height: height(context, 0.15),
                        aspectRatio: 80/22,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                      ),
                      items: banner!.map((e){
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ),
                            gradient: bannerBg
                          ),
                          padding: EdgeInsets.all(3),
                          //decoration: ,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                                // height: 40,
                                // width: 40,
                                imageUrl: '${e.photo}',
                                fit: BoxFit.fill,
                              ),
                          ),
                        );
                      }).toList(),
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
                      child: Center(
                        child: match!.responce!.matchData![1].upComingMatches!.isNotEmpty ? ListView(
                          children: [
                            for(int x=0; x<match!.responce!.matchData![1].upComingMatches!.length; x++)
                            upcominMatchWidget(match!.responce!.matchData![1].upComingMatches!,x)
                          ],
                          // itemCount: match.responce!.matchData![1].upComingMatches!.length,
                          // //itemCount: matches!.totalResult,
                          // itemBuilder: (ctx , index){
                          //   return upcominMatchWidget(match.responce!.matchData![1].upComingMatches!,index);
                          // }
                        ) : Text('No Matches Found!',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ) : Center(
        child: CircularProgressIndicator()
      ),
    );
  }

  Widget upcominMatchWidget(List<upcomingMatchData>? match,int index){
    var data = match![index];
    // print(data!.length);
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> joinTeam(match: data)));
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
                    '${data.leageTitle}',
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
                          imageUrl: '${data.teama!.logo}',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('${data.teama!.sortName}',
                        style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TimerWidget(mydurStart: data.timeStampStart!,mydurEnd: data.timeStampEnd!,startingTime: data.dateStart!,)
                    ],
                  ),
                  Row(
                    children: [
                      Text('${data.teamb!.sortName}',
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
                          imageUrl: '${data.teamb!.logo}',
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
                    child: Text('${data.teama!.name}',
                      style: TextStyle(
                        fontFamily: font
                      ),
                    )
                  ),
                  if(data.isLineUp==true)
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
                    child: Text('${data.teamb!.name}',
                      style: TextStyle(
                        fontFamily: font
                      ),
                    )
                  ),
                ],
              ),
            ),
            if(data.eventName!=null)
            Divider(
              thickness: 1,
              height: 0.5,
              color: dividerColor1,
            ),
            if(data.eventName!=null)
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
                children: [
                  SvgPicture.asset(M),
                  SizedBox(width: 5,),
                  Text('1st price win ₹${data.eventName}',
                    style: TextStyle(
                      color: textColor3
                    )
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