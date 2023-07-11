// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/VerifyAccountScreen.dart';
import 'package:playon69/Screens/DrawerScreen/addcashscreen.dart';
import 'package:playon69/Screens/MenuScreen.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Wallet')),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: 500,
          color: textColor1,
          child: Stack(alignment: Alignment.topCenter, children: [
            Positioned(height: 200, top: 30, child: Image.asset(walletbg)),
            Positioned(
              top: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 605, width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: borderColor5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),

                  //
                ),
              ),
              // )
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: Ass(walletbg)
              //
              //     )
              //   ),
              // ),
            ),
            Positioned(
                top: 100,
                height: 200,
                width: 350,
                child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(1, 1),
                          spreadRadius: -5
                          // Shadow position
                          ),
                    ]),
                    child: Image.asset(bluebackground))),
            Positioned(
              top: 130,
              left: 20,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 20),
                          child: Image.asset(
                            coin,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10, bottom: 1),
                              child: Text('Available Balance',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: font,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10, right: 65, top: 5),
                              child: Text('Rs 250.00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: font,
                                      color: textColor1)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: textColor2),
                                shape: BoxShape.rectangle,
                                color: textColor5,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 40,
                              width: 130,
                              child: Center(
                                child: const Text("Add Cash",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: font,
                                        color: textColor1)),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => addcash()));
                              print('tep on button');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: textColor2),
                                shape: BoxShape.rectangle,
                                color: textColor5,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 40,
                              width: 130,
                              child: Center(
                                child: const Text("Withdraw Cash",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: font,
                                        color: textColor1)),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => verifyaccount()));
                              print('tep on button');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 45,
              left: 17,
              child: Row(children: [
                InkWell(
                  child: Image.asset(backicon, height: 25),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Wallet',
                    style: TextStyle(
                        fontSize: 14, fontFamily: font, color: textColor1))
              ]),
            ),
            Positioned(
              top: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Image.asset(
                                            pinkcolor,
                                            height: 40,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 30,
                                          ),
                                          child: Container(
                                            height: 27,
                                            width: 75,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(pinkcolor),
                                              fit: BoxFit.fill,
                                            )),
                                          ),
                                        ),
                                        //child: Image.asset(pinkcolor,))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 15, right: 30),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 5,
                                            right: 40,
                                          ),
                                          child: Text(
                                            'Your Winnings',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: font,
                                                color: textColor2),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text('My Match Winnings',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: font,
                                                  color: textColor4)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Image.asset(
                                            greencolor,
                                            height: 40,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 27,
                                            width: 75,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(greencolor),
                                              fit: BoxFit.fill,
                                            )),
                                          ),
                                        ),
                                        //child: Image.asset(pinkcolor,))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 15, right: 50),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 5,
                                            right: 25,
                                          ),
                                          child: Text(
                                            'Deposited',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: font,
                                                color: textColor2),
                                          ),
                                        ),
                                        Text('Money You Add',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: font,
                                                color: textColor4)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    // elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Image.asset(
                                cashbonus,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text('Cash Bonus',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: font,
                                      color: textColor2)),
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Image.asset(coin, height: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text('Rs 100.0',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: font,
                                      color: Colors.orange)),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  kyc,
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('KYC & Verify Details',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: font,
                                        color: textColor2)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Wallet()));
                                    },
                                    icon: ImageIcon(
                                      AssetImage(forward),
                                      size: 20,
                                      color: textColor2,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          endIndent: 0,
                          indent: 0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                refer,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Refer and Earn',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: font,
                                      color: textColor2)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 125),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wallet()));
                                  },
                                  icon: ImageIcon(
                                    AssetImage(forward),
                                    size: 20,
                                    color: textColor2,
                                  )),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          endIndent: 0,
                          indent: 0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                transaction,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Transaction History',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: font,
                                      color: textColor2)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wallet()));
                                  },
                                  icon: ImageIcon(
                                    AssetImage(forward),
                                    size: 20,
                                    color: textColor2,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 332,
                right: 197,
                child: Row(children: [
                  Image.asset(coin, height: 15),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Rs 0.00',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: font,
                          color: Colors.green,
                          fontWeight: FontWeight.w700))
                ])),
            Positioned(
                top: 332,
                right: 25,
                child: Row(children: [
                  Image.asset(coin, height: 15),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Rs 1500',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: font,
                        color: textColor5,
                        fontWeight: FontWeight.w700),
                  )
                ]))
          ]),
        ),
      ),
    );
  }
}
