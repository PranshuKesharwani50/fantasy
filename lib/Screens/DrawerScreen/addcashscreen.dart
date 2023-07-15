import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Wallet.dart';

class addcash extends StatefulWidget {
  const addcash({super.key});

  @override
  State<addcash> createState() => _addcashState();
}

//
List<int> price = [100, 200, 300, 400];
bool ispressed = false;
Color cardcolor = textColor1;

class _addcashState extends State<addcash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Cash',
            style: TextStyle(
              fontSize: 14, 
              fontFamily: font
            )
          ),
        //automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Total Available Balance',
              style: TextStyle(
                fontSize: 14,
                fontFamily: font,
                color: textColor2,
                fontWeight: FontWeight.bold
              )
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
                padding: const EdgeInsets.only(left: 6),
                child: Text('Rs 100.0',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    color: textColor5,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 430,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: upcomingmatchCardBottomBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),

                // Note: Same code is applied for the TextFormField as well
                SizedBox(
                  height: 70,
                  width: 340,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Amount to Add", // icon is 48px

                      filled: true, //<-- SEE HERE
                      fillColor: textColor1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0, color: textColor1), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                  ),
                  child: Text(
                    '(Rs 23 to 10,000)',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: font,
                      color: textColor4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Or Select one of the amounts from below',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: font,
                        color: textColor2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                      'Use UPI/Bank Transfer when you withdraw more then Rs',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: font,
                        color: textColor4,
                      )),
                ),
                // Row(
                //   children: <Widget>[
                //     Flexible(
                //       flex: 2,
                //       child: TextFormField(
                //         textAlign: TextAlign.left,
                //         style: TextStyle(fontSize: 11.0),
                //         decoration: InputDecoration(
                //             contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                //             border: InputBorder.none,
                //             prefixIcon: Padding(
                //               padding: EdgeInsets.all(0.0),
                //               child: Icon(
                //                 Icons.search,
                //                 color: Colors.grey,
                //               ), // icon is 48px widget.
                //             ),
                //             hintText: 'Search artist, genre, playlist',
                //             hintStyle: TextStyle(fontSize: 11.0)),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < price.length; i++)
                        InkWell(
                          child: Card(
                            borderOnForeground: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                   Image.asset(coin, height: 15),


                                  Text('Rs ${price[i]}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: font,
                                        color: textColor2,
                                      )),

                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),

                          onTap: () {
                            setState(() {
                              cardcolor = cardcolor == textColor5
                                  ? textColor1
                                  : textColor5;
                            });

                            print('on tap');
                          },

                          //
                        )
                    ],
                  ),
                ),

                Row(
                  children: [
                    for (int i = 0; i < 2; i++)
                      Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          children: [
                            if (i == 0)
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 30,
                                        top: 20,
                                        bottom: 10),
                                    //child: Image.asset(upi, height: 25),
                                  ),
                                  Text('Pay Using UPI',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: font,
                                        color: textColor2,
                                      ))
                                ],
                              ),
                            if (i == 1)
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 20, top: 20, bottom: 10),
                                  //child: Image.asset(upi, height: 25),
                                ),
                                Text('Credit Card/Debit Card',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: font,
                                      color: textColor2,
                                    )),
                              ])
                          ],
                        ),
                      ),
                  ],
                ),
              ]),
              //
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: textColor5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                height: 50,
                width: 300,
                child: Center(
                  child: const Text("Pay Now",
                      style: TextStyle(
                          fontSize: 15, fontFamily: font, color: textColor1)),
                ),
              ),
              onTap: () {
                print('tep on button');
              },
            ),
          ),
        ],
      ),
    );
  }
}
