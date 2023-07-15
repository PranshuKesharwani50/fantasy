// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Wallet.dart';

class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: const Text('Withdraw Amount',
              style: TextStyle(fontSize: 14, fontFamily: font)),
          //automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Wallet()));
              },
              icon: const ImageIcon(
                AssetImage(backicon),
              )),
          titleSpacing: 4,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text('Winning Amount',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: font,
                        color: textColor2,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(coin, height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Center(
                    child: Text('Rs 100.0',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: font,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            // Text('Withdraw Amount'),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: new InputDecoration(
                  labelText: "Withdraw Money,",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Minimum Withdraw Rs 10',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: font,
                        color: textColor2,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Withdraw Methods',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: font,
                          color: textColor2,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'For UPI paytm withdraw KYC not Required',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: font,
                      color: textColor4,
                    ),
                  ),
                  SizedBox(height: 50, width: 30),
                  Row(
                    children: [
                      // Image.asset(
                      //   upi,
                      //   height: 25,
                      // ),
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Text('Bank Transfer',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: font,
                                    color: textColor2,
                                    fontWeight: FontWeight.bold)),
                            Text('Name',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: font,
                                  color: textColor4,
                                )),
                            Text('Account Number',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: font,
                                  color: textColor4,
                                )),
                            Text('IFSC',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: font,
                                  color: textColor4,
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
