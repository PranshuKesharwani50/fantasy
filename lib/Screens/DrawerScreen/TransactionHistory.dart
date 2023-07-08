import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';

class transactionhistory extends StatefulWidget {
  const transactionhistory({super.key});

  @override
  State<transactionhistory> createState() => _gamehistoryState();
}

class _gamehistoryState extends State<transactionhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appBgColor,
      appBar: AppBar(
        title: const Text('Transaction History',
            style: TextStyle(fontSize: 14, fontFamily: font)),
        //automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:ImageIcon(AssetImage(backicon))),
        titleSpacing: 4,
      ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 35,
                    width: 50,
                    child: Center(
                      child: InkWell(
                        child: const Text(
                          "All",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: font,
                              color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {});
                          print("Click event on Container");
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 35,
                      width: 60,
                      child: Center(
                        child: InkWell(
                          child: const Text("Deposit",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: Colors.black)),
                          onTap: () {
                            print('tep on button');
                          },
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 35,
                    width: 90,
                    child: Center(
                        child: InkWell(
                      child: const Text("Winning Cash",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: font,
                              color: Colors.black)),
                      onTap: () {
                        print('onn tap');
                      },
                    )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 35,
                      width: 80,
                      child: Center(
                        child: InkWell(
                          child: const Text("Withdraw",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  color: Colors.black)),
                          onTap: () {
                            print('on tap');
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 605, width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: borderColor5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  margin: const EdgeInsets.only(
                      top: 15, left: 10, right: 10, bottom: 480),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            child: Text('Fantasy Cricket Challenge Joined Free',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: Colors.black)),
                          ),
                          // Image.asset(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 100,
                              top: 10,
                            ),
                            child: Text('150',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: font,
                                    color: Colors.red)),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 10,
                        indent: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 140, top: 3),
                        child: Text(
                            'Transaction Id :' " " + 'FA12345X198756AV1',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: Colors.grey)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 230, top: 5),
                        child: Text('15 July,2022,' + '10:30',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: font,
                                color: Colors.grey)),
                      )
                    ],
                  ),
                ),
              ),
              //
            ),
          )
        ],
      ),
    );
  }
}
