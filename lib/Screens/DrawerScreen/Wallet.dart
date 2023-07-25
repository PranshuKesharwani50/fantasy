// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unnecessary_string_interpolations, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/transactionistoryModel.dart';
import 'package:playon69/Models/walletModel.dart';
import 'package:playon69/Screens/DrawerScreen/TransactionHistory.dart';
import 'package:playon69/Screens/DrawerScreen/addcashscreen.dart';
import 'package:playon69/Screens/DrawerScreen/withdraw_money.dart';
import 'package:playon69/Screens/others/VerifyScreen.dart';
import 'package:playon69/apis/callApi.dart';
import 'package:playon69/customs/CustomButton.dart';

import '../../apis/sharedPreference.dart';


class Wallet extends StatefulWidget {

  // bool? isDrawer;
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  WalletModel? walletModel;
  bool? isLoading = true;

  @override
  void initState() {
    super.initState();
    getWallet();
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
    body: isLoading == false ? SafeArea(
      child:Stack(
        children: [
          Image.asset(walletbg),
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
                    Text('Wallet',
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
                height: height(context, 0.15),
              ),
              Expanded(
                child: Container(
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
                      SizedBox(
                        height: height(context, 0.07),
                      ),
                      // for(int x=0; x<100; x++)
                      // Text('Demo')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              ),
                              color: tileBgColor
                            ),
                            padding: EdgeInsets.all(10),
                            width: width(context, 0.4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(pinkcolor)
                                        ),
                                      ),
                                      child: Icon(Icons.emoji_events_outlined,color: pinkTroppey,),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8)
                                        ),
                                        color: pinkBg
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Image.asset(coin,
                                            width: 20,
                                          ),
                                          SizedBox(width: 2,),
                                          Text('${walletModel!.walletInfo!.prizeAmt}',
                                            style: TextStyle(
                                              fontFamily: font,
                                              color: textColor5,
                                              fontSize: 14,
                                              // fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Your Winnings',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 13,
                                        color: textColor6
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text('My Matches Winnings',
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
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              ),
                              color: tileBgColor
                            ),
                            padding: EdgeInsets.all(10),
                            width: width(context, 0.4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(greencolor)
                                        ),
                                      ),
                                      child: Icon(Icons.account_balance_wallet_outlined,color: greenWallet,),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8)
                                        ),
                                        color: greenBg
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Image.asset(coin,
                                            width: 20,
                                          ),
                                          SizedBox(width: 2,),
                                          Text('${walletModel!.walletInfo!.depositAmt!.toStringAsFixed(00)}',
                                            style: TextStyle(
                                              fontFamily: font,
                                              color: textColor3,
                                              fontSize: 14,
                                              // fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Deposited',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 13,
                                        color: textColor6
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text('Money You Add',
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
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
                                  SvgPicture.asset(cash),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Cash Bonus',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 13,
                                          color: textColor6
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Offer Earned Bonus',
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
                              Row(
                                children: [
                                  Image.asset(coin,height: 15,),
                                  SizedBox(width: 5,),
                                  Text('${walletModel!.walletInfo!.bonus}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold,
                                      color: textColor7
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => VerifyScreen())));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  ),
                                  color: tileBgColor
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(kyc),
                                        SizedBox(width: 20),
                                        Text('KYC & Verify Details',
                                          style: TextStyle(
                                            fontFamily: font,
                                            fontSize: 13,
                                            color: textColor6
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(goIn)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: borderColor5
                                  ),
                                  bottom: BorderSide(
                                    color: borderColor5
                                  )
                                ),
                                color: tileBgColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(refer),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Refer and Earn',
                                            style: TextStyle(
                                              fontFamily: font,
                                              fontSize: 13,
                                              color: textColor6
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Invite a Friend and Collect up to ₹100 Cash Bonus',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: font,
                                              color: textColor4
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(goIn)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => transactionhistory()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                  ),
                                  color: tileBgColor
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(history),
                                        SizedBox(width: 20,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Transaction-History',
                                              style: TextStyle(
                                                fontFamily: font,
                                                fontSize: 13,
                                                color: textColor6
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text('All Transaction History Deposit and Withdraw',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: font,
                                                color: textColor4
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(goIn)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context, 0.1),)
                    ],
                  )
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height(context, 0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    //alignment: Alignment.center,
                    width: width(context, 0.9),
                    height: height(context, 0.23),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bluebackground),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(coin),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Available Balance',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor1,
                                    fontSize: 16
                                  ),
                                ),
                                Text('₹${walletModel!.walletInfo!.walletAmount}',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => addcash())));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width(context, 0.35),
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: buttonBgColor
                                ),
                                child: Text('Add Cash',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor1,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if(walletModel!.walletInfo!.bankAccountVerified==2 && walletModel!.walletInfo!.documentVerified==2){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => withdraw()));
                                }else{
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => VerifyScreen()));
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width(context, 0.35),
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: buttonBgColor
                                ),
                                child: Text('Withdraw Cash',
                                  style: TextStyle(
                                    fontFamily: font,
                                    color: textColor1,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ])
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}