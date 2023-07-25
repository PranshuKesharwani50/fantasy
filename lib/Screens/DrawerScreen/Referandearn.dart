import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/CommonFunctions.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/assets.dart';

class referandearn extends StatefulWidget {
  referandearn({super.key});

  @override
  State<referandearn> createState() => _referandearnState();
}

String data = 'suraj';

class _referandearnState extends State<referandearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -4,
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Text('Refer & Earn',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Earn up to Rs 100 Everytime you refer! 10% Commission Refer',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: font,
                          fontWeight: FontWeight.bold,
                          color: textColor2
                        ),
                      )
                    ),
                    SizedBox(width: width(context, 0.15)),
                    Image.asset(r_e,
                      width: width(context, 0.35),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Introduce Friends to Playon69',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: font,
                            color: textColor4
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('by referring them and earn upto ₹100',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: font,
                            color: textColor4
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: Stack(
                children: [
                  SvgPicture.asset(referBg,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('REFERRAL CODE'),
                                  Container(),
                                  Text('DEMO123'),
                                ],
                              ),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: buttonBgColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5)
                                    )
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.copy,size: 15,color: iconColor1,),
                                      SizedBox(width: 2,),
                                      Text('Copy',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: font,
                                          color: textColor1
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
