
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(walletbg),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(walletbg)
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: height(context, 0.06),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pranshu',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 15
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text('7000xxxxx00',
                                style: TextStyle(
                                  fontFamily: font,
                                  color: textColor1,
                                  fontSize: 12
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: buttonBgColor1,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            )
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(editProfile),
                              SizedBox(width: 5,),
                              Text('Edit Profile',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: font,
                                  color: textColor5
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                        child: SvgPicture.asset(goBack),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 10,),
                      Text('My Profile',
                        style: TextStyle(
                          color: textColor1,
                          fontFamily: font,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height(context, 0.13),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                      ),
                      color: upComingBg,
                    ),
                    //width: double.infinity,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ),
                            color: tileBgColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(kyc2),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('KYC Verify',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 13,
                                          color: textColor6
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Complete KYC to Get Withdrawal',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: font,
                                          color: textColor4
                                        ),
                                      )
                                    ],
                                  )
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
                                  child: Text('Verify KYC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: font,
                                      color: textColor1
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ),
                            color: tileBgColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(referal),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Use Refer Code',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 13,
                                          color: textColor6
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      // Text('Offer Earned Bonus',
                                      //   style: TextStyle(
                                      //     fontSize: 11,
                                      //     fontFamily: font,
                                      //     color: textColor4
                                      //   ),
                                      // )
                                    ],
                                  )
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
                                  child: Text('Apply',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: font,
                                      color: textColor1
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Your Performance',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: font,
                            color: textColor2
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: tileBgColor
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 1,
                                    color: borderColor6
                                  ),
                                  color: totalGamePlayedBg
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(tgp,width: 50,),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Games Played',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 15,
                                            color: textColor6
                                          ),
                                        ),
                                        Text('10',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 24,
                                            color: textColor6
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(10),
                        //           topRight: Radius.circular(10)
                        //         ),
                        //         color: tileBgColor
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(kyc),
                        //               SizedBox(width: 20),
                        //               Text('KYC & Verify Details',
                        //                 style: TextStyle(
                        //                   fontFamily: font,
                        //                   fontSize: 13,
                        //                   color: textColor6
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         border: Border(
                        //           top: BorderSide(
                        //             color: borderColor5
                        //           ),
                        //           bottom: BorderSide(
                        //             color: borderColor5
                        //           )
                        //         ),
                        //         color: tileBgColor,
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(refer),
                        //               SizedBox(width: 20,),
                        //               Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text('Refer and Earn',
                        //                     style: TextStyle(
                        //                       fontFamily: font,
                        //                       fontSize: 13,
                        //                       color: textColor6
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 5,),
                        //                   Text('Invite a Friend and Collect up to ₹100 Cash Bonus',
                        //                     style: TextStyle(
                        //                       fontSize: 11,
                        //                       fontFamily: font,
                        //                       color: textColor4
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.only(
                        //           bottomLeft: Radius.circular(10),
                        //           bottomRight: Radius.circular(10)
                        //         ),
                        //         color: tileBgColor
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               SvgPicture.asset(history),
                        //               SizedBox(width: 20,),
                        //               Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text('Transaction-History',
                        //                     style: TextStyle(
                        //                       fontFamily: font,
                        //                       fontSize: 13,
                        //                       color: textColor6
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 5,),
                        //                   Text('All Transaction History Deposit and Withdraw',
                        //                     style: TextStyle(
                        //                       fontSize: 11,
                        //                       fontFamily: font,
                        //                       color: textColor4
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           SvgPicture.asset(goIn)
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: height(context, 0.1),)
                      ],
                    )
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