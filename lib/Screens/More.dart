// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:playon69/Screens/DrawerScreen/Profile.dart';
import 'package:playon69/Screens/DrawerScreen/Referandearn.dart';
import 'package:playon69/Screens/DrawerScreen/support.dart';

import '../Extra/AppTheme.dart';
import '../Extra/config.dart';
import '../apis/sharedPreference.dart';
import '../auth/login.dart';
import 'DrawerScreen/Web/webviewScreen.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Morewidget(
            icon: Icons.person, 
            title: 'Profile', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            }
          ),
          Morewidget(
            icon: Icons.share, 
            title: 'Refer & Earn', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => referandearn())));
            }
          ),
          Morewidget(
            icon: Icons.info, 
            title: 'About Us', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => WebViewScreen(title: 'About Us',endPoint: 'about-us'))));
            }
          ),
          Morewidget(
            icon: Icons.help, 
            title: 'How to Play', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => WebViewScreen(title: 'How To Play',endPoint: 'how-to-play'))));
            }
          ),
          Morewidget(
            icon: Icons.leaderboard, 
            title: 'Fantasy Point System', 
            press: (){}
          ),
          Morewidget(
            icon: Icons.privacy_tip_rounded, 
            title: 'Privacy Policy', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => WebViewScreen(title: 'Privacy Policy',endPoint: 'privacy-policy'))));
            }
          ),
          Morewidget(
            icon: Icons.receipt_long, 
            title: 'Term & Conditions', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => WebViewScreen(title: 'Term & Conditions',endPoint: 'terms-and-conditions'))));
            }
          ),
          Morewidget(
            icon: Icons.gavel_rounded, 
            title: 'Legality', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => WebViewScreen(title: 'Legality',endPoint: 'legalities'))));
            }
          ),
          Morewidget(
            icon: Icons.support_agent, 
            title: 'Contact Us', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Supports())));
            }
          ),
          Morewidget(
            icon: Icons.logout, 
            title: 'Logout', 
            press: (){
              removePref(context: context, key: 'currentUser');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> Login()));
            }
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Version $version',
                style: TextStyle(
                  color: textColor4,
                  fontFamily: font,
                  fontSize: 13
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Morewidget extends StatelessWidget {
  Morewidget({
    required this.icon,
    required this.title,
    required this.press,
  });
  IconData? icon;
  String? title;
  Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //SvgPicture.asset(icon!),
                  Icon(icon,color: iconColor6,),
                  SizedBox(
                    width: 10,
                  ),
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
              // InkWell(
              //   onTap: () {},
              //   child: SvgPicture.asset(goInside),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
