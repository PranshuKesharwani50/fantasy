// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Privacypolicy.dart';
import 'package:playon69/Screens/DrawerScreen/Profile.dart';

import '../Extra/AppTheme.dart';
import '../Extra/config.dart';
import '../apis/sharedPreference.dart';
import '../auth/login.dart';
import 'DrawerScreen/TermCondition.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Morewidget(
            icon: logout, 
            title: 'Profile', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            }
          ),
          Morewidget(
            icon: refer, 
            title: 'Refer & Earn', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
            title: 'About Us', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
            title: 'How to Play', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
            title: 'Fantasy Point System', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
            title: 'Privacy Policy', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => PrivacyPolicy())));
            }
          ),
          Morewidget(
            icon: logout, 
            title: 'Term & Conditions', 
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => TermCondition())));
            }
          ),
          Morewidget(
            icon: logout, 
            title: 'Legal', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
            title: 'Contact Us', 
            press: (){}
          ),
          Morewidget(
            icon: logout, 
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
  String? icon;
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
                  SvgPicture.asset(icon!),
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
