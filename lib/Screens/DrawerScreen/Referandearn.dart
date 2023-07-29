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
              padding: EdgeInsets.only(
                top: 10
              ),
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SvgPicture.asset(referBg,
                    width: width(context, 1),
                  ),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(context, 0.001),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: borderColor3
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: width(context, 0.16),
                                    child: Text('REFERRAL CODE',
                                      style: TextStyle(
                                        color: textColor2,
                                        fontSize: 12,
                                        fontFamily: font
                                      ),
                                    )
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: borderColor3
                                        )
                                      )
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 10,
                                      left: 15
                                    ),
                                    child: Text('DEMO123',
                                      style: TextStyle(
                                        color: textColor2,
                                        fontSize: 20,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ),
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
                        ),
                        SizedBox(
                          height: height(context, 0.02),
                        ),
                        InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(sow),
                        ),
                        SizedBox(
                          height: height(context, 0.06),
                        ),
                        Row(
                          children: [
                            Text('How does it work?',
                              style: TextStyle(
                                color: textColor2,
                                fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            SvgPicture.asset(your),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your both Invite your Friends',
                                  style: TextStyle(
                                    color: textColor2,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text('Just share your referral code',
                                  style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 13
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            SvgPicture.asset(deviceWaller),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('You both Signup & deposit',
                                  style: TextStyle(
                                    color: textColor2,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text('Refer your friends for signup and deposit',
                                  style: TextStyle(
                                    color: textColor4,
                                    fontFamily: font,
                                    fontSize: 13
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
