// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/Home.dart';
import 'package:playon69/customs/BottomBarButtons.dart';

import '../Extra/AppTheme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<Widget> allScreens = <Widget>[
    Home(),
    Container(
      child: Text('Screen 2')
    ),
    Container(
      child: Text('Screen 3')
    ),
    Container(
      child: Text('Screen 4')
    ),
  ];

  int _selectedIndex = 0;

  void jumpTo(int ind){
    setState(() {
      _selectedIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          allScreens[_selectedIndex],
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                height: 65,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                    child: BottomBarButton(
                      icon: homeButton,
                      buttonLabel: 'Home',
                      //fontFamily: font,
                      fontsize: 10,
                      color: _selectedIndex == 0 ? buttomBarButtonColor : bottomBarButtonColor2,
                      //selectedColor: _selectedIndex == 0 ?selectedColor : null,
                      iconsize: 20,
                      space: 3,
                      selected: _selectedIndex == 0 ? true : false,
                      onTap: (){
                        jumpTo(0);
                        //check(false,0);
                      },
                    ),
                    ),
                    Expanded(
                      child: BottomBarButton(
                      icon: myContest,
                      buttonLabel: 'My Contest',
                      //fontFamily: font,
                      fontsize: 10,
                      color: _selectedIndex == 1 ? buttomBarButtonColor : bottomBarButtonColor2,
                      //selectedColor: _selectedIndex == 1 ?selectedColor : null,
                      selected: _selectedIndex == 1 ? true : false,
                      space: 3,
                      iconsize: 20,
                      onTap: (){
                        jumpTo(1);
                      //check(false,1);
                        },
                      ),
                    ),
                    //SizedBox(width: 60,),
                    Expanded(
                      child: BottomBarButton(
                      icon: upgradeApp,
                      buttonLabel: 'UpgradeApp',
                      fontsize: 10,
                      //fontFamily: font,
                      color: _selectedIndex == 2 ? buttomBarButtonColor : bottomBarButtonColor2,
                      //selectedColor: _selectedIndex == 2 ?selectedColor : null,
                      selected: _selectedIndex == 2 ? true : false,
                      iconsize: 20,
                      space: 3,
                      onTap: (){
                        jumpTo(2);
                        //check(false,2);
                        },
                      ),
                    ),
                    Expanded(
                      child: BottomBarButton(
                      icon: more,
                      buttonLabel: 'More',
                      space: 3,
                      fontsize: 10,
                      //fontFamily: font,
                      color: _selectedIndex == 3 ? buttomBarButtonColor : bottomBarButtonColor2,
                      //selectedColor: _selectedIndex == 3 ?selectedColor : null,
                      selected: _selectedIndex == 3 ? true : false,
                      iconsize: 20,
                      onTap: (){
                        jumpTo(3);
                        //check(false,3);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}