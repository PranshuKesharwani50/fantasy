import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/addcashscreen.dart';
import 'package:playon69/Screens/Home.dart';
class gamehistory extends StatefulWidget {
  const gamehistory({super.key});

  @override
  State<gamehistory> createState() => _gamehistoryState();
}

class _gamehistoryState extends State<gamehistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game History',
            style: TextStyle(fontSize: 14, fontFamily: font)),
        //automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
    leading: IconButton(
    onPressed: (){
    Navigator.pop(context);
    },
    icon:ImageIcon(AssetImage(backicon)
    )
    ),
        titleSpacing: 4,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:textColor2),
                      shape: BoxShape.rectangle,
                      color: textColor1,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 35,
                    width: 80,
                    child: Center(
                      child: InkWell(
                        child: const Text(
                          "Ludo",
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
                  padding: const EdgeInsets.only(left:2),
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
                      width: 110,
                      child: Center(
                        child: InkWell(
                          child: const Text("Fantasy Sports",
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
                  padding: const EdgeInsets.only(left: 10),
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
                    width:120,
                    child: Center(
                        child: InkWell(
                          child: const Text("Snake Ladder",
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
                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(color: Colors.black),
                //         shape: BoxShape.rectangle,
                //         color: Colors.white,
                //         borderRadius: const BorderRadius.all(
                //           Radius.circular(20),
                //         ),
                //       ),
                //       height: 35,
                //       width: 80,
                //       child: Center(
                //         child: InkWell(
                //           child: const Text("Withdraw",
                //               style: TextStyle(
                //                   fontSize: 13,
                //                   fontFamily: font,
                //                   color: Colors.black)),
                //           onTap: () {
                //             print('on tap');
                //           },
                //         ),
                //       ),
                //     )),
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
                      borderRadius: BorderRadius.all(Radius.circular(12)
                      )
                  ),
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
                            child: Text('Lost Against R4-P17_600300',
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
                        padding: EdgeInsets.only(right: 160, top: 3),
                        child: Text(
                            'Battle Id :' " " + 'FA12345X198756AV1',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: font,
                                color: Colors.grey)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 211, top: 5),
                        child: Text('15 July,2022,' + '10:30 am',
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
