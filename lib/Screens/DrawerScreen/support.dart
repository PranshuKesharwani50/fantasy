import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Extra/AppTheme.dart';
import '../../Extra/CommonFunctions.dart';
import '../../Extra/assets.dart';

class Supports extends StatelessWidget {
  const Supports({super.key});

  void sendMail() async{

    Uri lauch = Uri(
      scheme: 'mailto',
      path: 'pranshukesharwani50@gmail.com',
    );
    await launchUrl(lauch);

  }

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
        title: Text('Support',
          style: TextStyle(
            color: textColor1,
            fontFamily: font,
            fontSize: 14
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SvgPicture.asset(shareBg),
                    SizedBox(height: 20,),
                    Text('Contact us at below Platforms',
                      style: TextStyle(
                        color: textColor2,
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    Text('Available 24*7',
                      style: TextStyle(
                        color: textColor2,
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    )
                  ],
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: height(context, 0.53),
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: ListView(
                children: [
                  InkWell(
                    onTap: sendMail,
                    child: Container(
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
                              SvgPicture.asset(email),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email us:',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 12,
                                      color: textColor4
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text('write_me@playon69.com',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: font,
                                      color: textColor2
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
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
                            SvgPicture.asset(chat),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Create Support Ticket:',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: textColor4
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('We are ready to help!',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: textColor2
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          endIndent: 15,
                        )
                      ),
                      Text('Follow Us',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                          color: textColor2
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 15,
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Image.asset(fb,height: 40,),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Image.asset(insta,height: 40,),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Image.asset(yt,height: 40,),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Image.asset(tw,height: 40,),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Image.asset(tg,height: 35,),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
