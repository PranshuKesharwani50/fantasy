// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Extra/AppTheme.dart';
import '../Extra/CommonFunctions.dart';
import '../Extra/assets.dart';
import '../Models/MathesModel.dart';
import '../apis/apis.dart';
import '../apis/sharedPreference.dart';

class JoinContestConfermation extends StatefulWidget {
  JoinContestConfermation({
    required this.entryFee,
    required this.useAbleBonus,
    required this.teamIds,
    required this.match,
    required this.contestId
  });

  int? entryFee;
  int useAbleBonus = 0;
  int? contestId;
  List<int>? teamIds;
  upcomingMatchData? match;

  @override
  State<JoinContestConfermation> createState() => _JoinContestConfermationState();
}

class _JoinContestConfermationState extends State<JoinContestConfermation> {

  int totalFee = 0;
  double totalBonus = 0;
  double? totalAmt = 0;

  void calculate(){
    totalFee = widget.entryFee! * widget.teamIds!.length;
    double bonusPer = widget.useAbleBonus / 100;
    totalBonus = totalFee * bonusPer;
    totalAmt = totalFee - totalBonus;
  }

  @override
  void initState() {
    calculate();
    super.initState();
  }

  join() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    var responce = await joinContest(res['token'], '${widget.match!.matchId!}', res['user_data']['user_name'], widget.contestId!, widget.teamIds!);
    print('join : $responce');
    if(responce['code']==200){
      //getMatchData();
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: responce['message']);
      Navigator.of(context).pop();
    }else{
      Fluttertoast.showToast(msg: responce['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        ),
        color: appBgColor
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Confirmation',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  color: textColor2
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Confirmation + Winnings=',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: font,
                      color: textColor5
                    ),
                    ),
                    Image.asset(coin)
                  ],
                )
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Image.asset(close)
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Entry Fees',
              style: TextStyle(
                fontSize: 13,
                fontFamily: font,
                color: textColor4
              ),
            ),
            Row(
              children: [
                Image.asset(coin),
                Text('$totalFee',
                  style: TextStyle(
                   fontSize: 13,
                   fontFamily: font,
                   color: textColor2
                 ),
               ),
             ],
           )
         ],
       ),
       SizedBox(height: 15,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text('Usable Cash Bonus (${widget.useAbleBonus}%)',
             style: TextStyle(
             fontSize: 13,
             fontFamily: font,
             color: textColor4
             ),
           ),
           Row(
             children: [
               Image.asset(coin),
               Text(' - $totalBonus',
                 style: TextStyle(
                   fontSize: 13,
                   fontFamily: font,
                   color: textColor2
                 ),
               ),
             ],
           )
         ],
       ),
       SizedBox(height: 15,),
       Container(
         padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5)
            ),
            border: Border.all(
              color: borderColor3
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Payable Amount',
                style: TextStyle(
                fontSize: 12,
                fontFamily: font,
                color: textColor5
              ),
            ),
            Row(
              children: [
                Image.asset(coin),
                  Text('$totalAmt',
                    style: TextStyle(
                    fontSize: 13,
                    fontFamily: font,
                    color: textColor5
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(height: 20,),
      Text('By joining this contest you accept Playon69 T&C & Privacy Policy Confirm that you are not a resident of Assam, Odisha, Telangana, Nagaland or Sikkim.',
        style: TextStyle(
          color: textColor4,
          fontSize: 12
        ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            join();
          },
          child: Container(
            width: width(context, 0.45),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: 12,
              bottom: 12
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: buttonBgColor4
            ),
            child: Text('Confirm',
              style: TextStyle(
                fontSize: 15,
                fontFamily: font,
                color: textColor1
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}