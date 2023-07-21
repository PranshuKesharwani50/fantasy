// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import, must_be_immutable, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:playon69/Screens/Dashboard.dart';
import 'package:playon69/Screens/DrawerScreen/GameHistory.dart';
import 'package:playon69/Screens/DrawerScreen/Profile.dart';
import 'package:playon69/Screens/DrawerScreen/Referandearn.dart';
import 'package:playon69/Screens/DrawerScreen/TransactionHistory.dart';
import 'package:playon69/Screens/DrawerScreen/Wallet.dart';
import 'package:playon69/Screens/DrawerScreen/addcashscreen.dart';
import 'package:playon69/Screens/DrawerScreen/changepassword.dart';
import 'package:playon69/Screens/DrawerScreen/support.dart';
import 'package:playon69/Screens/DrawerScreen/withdraw_money.dart';
import 'package:playon69/apis/sharedPreference.dart';
import 'package:playon69/auth/login.dart';
import 'package:timezone/standalone.dart' as tz;

import '../Extra/config.dart';
import '../Models/profileModel.dart';
import '../Models/walletModel.dart';
import '../apis/callApi.dart';
import 'DrawerScreen/Web/webviewScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  void convertUTCToIST() async {

    int utcTimestamp = 1684677600;
    DateTime utcDateTime =
        DateTime.fromMillisecondsSinceEpoch(utcTimestamp, isUtc: true);
    DateTime istDateTime = utcDateTime.toLocal();
    print(istDateTime);
    String formattedTime = DateFormat('').format(istDateTime);
    print('IST Time: $formattedTime');

  }

  late LoginResponceModel myProfile;
  WalletModel? walletModel;
  String? userId;

  bool isLoading = true;

  getUser() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    userId = res['user_data']['user_name'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getProfile();
    getWallet();
  }

  void getProfile() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    myProfile = LoginResponceModel.fromJson(res);
    setState(() {});
  }

  getWallet() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    walletModel = await getWalletDetails1(context, res['token'], res['user_data']['user_name']);
    if(walletModel!.status==true){
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: height(context, 0.07)),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (
                              (context) => Profile()
                            )
                          )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: notificationPanelColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // CircleAvatar(
                                //   radius: 30,
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    border: Border.all(
                                      width: 2,
                                      color: borderColor
                                    )
                                  ),
                                  child: ClipRRect(
                                    child: myProfile.userData!.profileImg == null ? Image.asset(profileBg,height: 60,) : 
                                    CachedNetworkImage(
                                      imageUrl: '${myProfile.userData!.profileImg}',
                                      fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${myProfile.userData!.name}',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 15,
                                        color: textColor1
                                      ),
                                    ),
                                    Text(
                                      '${myProfile.userData!.mno}',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 15,
                                        color: textColor1
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'View My Profile',
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
                            SvgPicture.asset(drawerGo),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Drawerwidget(
                        icon: wlt,
                        title: 'Wallet',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => Wallet()));
                        }),
                    Drawerwidget(
                        icon: af,
                        title: 'Add Fund',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => addcash()));
                        }),
                    Drawerwidget(
                        icon: wf,
                        title: 'Withdraw-funds',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => withdraw()));
                        }),
                    Drawerwidget(
                        icon: wf,
                        title: 'Investment Leaderboard',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => WebViewScreen(title: 'Investment Leaderboard',endPoint: 'external-invesment-leaderbord/$userId')));
                        }),
                    Drawerwidget(
                        icon: gh,
                        title: 'Game History',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => gamehistory()));
                        }),
                    Drawerwidget(
                        icon: ts,
                        title: 'Transaction-History',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => transactionhistory()));
                        }),
                    Drawerwidget(
                        icon: wf, 
                        title: 'Change Password', 
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => changepassword()));
                        }),
                    Drawerwidget(
                        icon: support, 
                        title: 'Supports', 
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => Supports()));
                        }),
                    Drawerwidget(
                        icon: re, 
                        title: "Refer-earn", 
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => referandearn()));
                        }),
                    Drawerwidget(
                        icon: notification,
                        title: 'Refund Policy',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => WebViewScreen(title: 'Refund Policy',endPoint: 'refund-cancellation',)));
                        }),
                    Drawerwidget(
                        icon: notification,
                        title: 'Privacy Policy',
                        press: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (ctx) => WebViewScreen(title: 'Privacy Policy',endPoint: 'privacy-policy')));
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            removePref(context: context, key: 'currentUser');
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> Login()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: width(context, 0.2)),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 1.5, color: borderColor5)),
                            child: Row(
                              children: [
                                SvgPicture.asset(logout),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Logout',
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
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: borderColor5, width: 1.5)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(update),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'App Update Now',
                                style: TextStyle(
                                    fontFamily: font,
                                    color: textColor4,
                                    fontSize: 13),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Version $version',
                                style: TextStyle(
                                    fontFamily: font,
                                    color: textColor4,
                                    fontSize: 11),
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
      ),
      appBar: AppBar(
        backgroundColor: appBarColor,
        actions: <Widget>[
          Row(
            children: [
              Image.asset(coin,height: 15,),
              SizedBox(width: 1,),
              Text(isLoading == true ? '₹0.0' : '₹${walletModel!.walletInfo!.walletAmount!.toStringAsFixed(0)}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 13
                ),
              )
            ],
          ),
          SizedBox(width: 10,),
          InkWell(
            child: SvgPicture.asset(walletHome),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wallet()));
            },
          ),
          SizedBox(
            width: 15,
          )
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
              //width: double.infinity,
              height: height(context, 0.12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    banner1,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    DateTime.now().toUtc();
                    convertUTCToIST();
                  },
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          classicLudo,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          pointLudo,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context, 0.13),
                    width: width(context, 0.28),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          gotiLudo,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Dashboard())));
                  },
                  child: Container(
                    height: height(context, 0.13),
                    //width: width(context, 0.28),
                    width: width(context, 0.45),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          fantasy,
                          fit: BoxFit.fill,
                        )),
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
                  onTap: () {},
                  child: Container(
                    height: height(context, 0.13),
                    //width: width(context, 0.28),
                    width: width(context, 0.45),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          snakeLeader,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    //color: Colors.red,
                    height: height(context, 0.15),
                    width: width(context, 0.94),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          rummyGame,
                          fit: BoxFit.fill,
                        )),
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
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon!),
                SizedBox(
                  width: 20,
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
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(goInside),
            ),
          ],
        ),
      ),
    );
  }
}
