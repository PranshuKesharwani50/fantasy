// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/Dashboard.dart';
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
      drawer: Drawer(),
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