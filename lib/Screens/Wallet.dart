// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:playon69/Extra/CommonFunctions.dart';

import '../Extra/assets.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(walletbg)
                    )
                  ),
                ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       height: height(context, 0.7),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25),
            //           topRight: Radius.circular(25)
            //         )
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}