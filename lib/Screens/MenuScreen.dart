// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/Dashboard.dart';
import 'package:playon69/Screens/Wallet.dart';
import 'package:timezone/standalone.dart' as tz;

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void convertUTCToIST() async{
  // Get the current UTC time
  // DateTime utcTime = DateTime.now().toUtc();

  // print(DateTime.now().millisecondsSinceEpoch);
  // print(utcTime);

  int utcTimestamp = 1684677600;
  DateTime utcDateTime = DateTime.fromMillisecondsSinceEpoch(utcTimestamp, isUtc: true);
  DateTime istDateTime = utcDateTime.toLocal();
  print(istDateTime);
  String formattedTime = DateFormat('').format(istDateTime);
  print('IST Time: $formattedTime');

  // await tz.initializeTimeZone();

  // var location = DateTime.now();

  // print('location $location');

  // // Define the IST time zone
  // final istTimeZone = tz.getLocation('Asia/Calcutta');

  // // Convert UTC time to IST
  // DateTime istTime = tz.TZDateTime.from(utcTime, istTimeZone);

  // // Format the IST time as per your requirement
  // String formattedISTTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(istTime);

  // print('IST Time: $formattedISTTime');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height(context, 0.07)
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Demo',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 15,
                                    color: textColor1
                                  ),
                                ),
                                Text(
                                  '7000xxx879',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 15,
                                    color: textColor1
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('View My Profile',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 10,
                                    color: textColor1
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(drawerGo),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Drawerwidget(
                    icon: wlt, 
                    title: 'Wallet', 
                    press: (){
                      Navigator.of(context).pop();
                      Navigator.push(context,MaterialPageRoute(builder: (ctx)=> Wallet()));
                    }
                  ),
                  Drawerwidget(
                    icon: af, 
                    title: 'Add Fund', 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: wf, 
                    title: 'Withdraw-funds', 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: gh, 
                    title: 'Game History', 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: ts, 
                    title: 'Transaction-History', 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: re, 
                    title: "Refer-earn", 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: notification, 
                    title: 'Notification', 
                    press: (){}
                  ),
                  Drawerwidget(
                    icon: support, 
                    title: 'Supports', 
                    press: (){}
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: width(context, 0.2)
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            ),
                            border: Border.all(
                              width: 1.5,
                              color: borderColor5
                            )
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(logout),
                              SizedBox(width: 10,),
                              Text('Logout',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor2,
                                  fontSize: 14
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                      border: Border.all(
                        color: borderColor5,
                        width: 1.5
                      )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(update),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('App Update Now',
                              style: TextStyle(
                                fontFamily: font,
                                color: textColor4,
                                fontSize: 13
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Version 1.0.0',
                              style: TextStyle(
                                fontFamily: font,
                                color: textColor4,
                                fontSize: 11
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: appBarColor,
        actions: <Widget>[
          InkWell(
            child: SvgPicture.asset(walletHome),
            onTap: (){},
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // image: DecorationImage(
                //   image: AssetImage(banner1)
                // )
              ),
              width: double.infinity,
              height: height(context, 0.12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(banner1,fit: BoxFit.fill,)
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    DateTime.now().toUtc();
                    convertUTCToIST();
                  },
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(classicLudo,fit: BoxFit.fill,)
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(pointLudo,fit: BoxFit.fill,)
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(gotiLudo,fit: BoxFit.fill,)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => Dashboard())));
                  },
                  child: Container(
                    height: height(context, 0.13),
                    //width: width(context, 0.28),
                    width: width(context, 0.45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(fantasy,fit: BoxFit.fill,)
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: (){},
                //   child: Container(
                //     //color: Colors.red,
                //     height: height(context, 0.13),
                //     width: width(context, 0.28),
                //     //width: width(context, 0.45),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(10),
                //       child: Image.asset(rummyGame,fit: BoxFit.fill,)
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height(context, 0.13),
                    //width: width(context, 0.28),
                    width: width(context, 0.45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(snakeLeader,fit: BoxFit.fill,)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    //color: Colors.red,
                    height: height(context, 0.15),
                    width: width(context, 0.94),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(rummyGame,fit: BoxFit.fill,)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Drawerwidget extends StatelessWidget {
  Drawerwidget({
    required this.icon,
    required this.title,
    required this.press,
  });
  String? icon;
  String? title;
  Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon!),
                SizedBox(width: 20,),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor2,
                    fontFamily: font
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){},
              child: SvgPicture.asset(goInside),
            ),
          ],
        ),
      ),
    );
  }
}