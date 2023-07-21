// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/assets.dart';

import '../../Extra/CommonFunctions.dart';
import '../../customs/CustomTextField.dart';

class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {

  TextEditingController amt = TextEditingController(text : '0.0');

  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Withdraw',
            style: TextStyle(
              fontSize: 14, 
              fontFamily: font
            )
          ),
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: ImageIcon(AssetImage(backicon))
        ),
        titleSpacing: -4,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Winning Amount',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 16,
                        color: textColor2
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(coin,height: 15,),
                        SizedBox(width: 10,),
                        Text('250.0',
                          style: TextStyle(
                            fontFamily: font,
                            color: textColor5,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: upComingBg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    font: font,
                    fontColor: textColor4,
                    fontSize: 12,
                    radiusSize: 10,
                    paddingSize: EdgeInsets.all(10),
                    label: 'Withdraw Amount', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Withdraw Amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Withdraw Amount',
                        hintStyle: TextStyle(
                          fontFamily: font
                        )
                      ),
                      controller: amt,
                    )
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Min Rs. 200 & max Rs. 10,000 allowed per day',
                        style: TextStyle(
                          fontFamily: font,
                          color: textColor4,
                          fontSize: 11
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Withdraw Methods',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor2
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Use UPI/Bank Transfer when you withdraw more then Rs. 10,000',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 12,
                      color: textColor4
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: index==0 ? borderColor2 : borderColor
                        ),
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
                              SvgPicture.asset(upi),
                              SizedBox(width: 15,),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 0.8,
                                      color: borderColor3
                                    )
                                  )
                                ),
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Withdraw to UPI',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: textColor2
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('xyz2000@ybl',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 13,
                                      color: textColor4
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(index==0 ? selected : unselected),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: index==1 ? borderColor2 : borderColor
                        ),
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
                              SvgPicture.asset(bank),
                              SizedBox(width: 15,),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 0.8,
                                      color: borderColor3
                                    )
                                  )
                                ),
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bank Transfer',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: textColor2
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('9800100211000',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 13,
                                      color: textColor4
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(index==1 ? selected : unselected),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateTeam(match: widget.match,)));
        },
        child: Container(
          height: height(context, 0.06),
          width: width(context, 0.9),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: 15,
            bottom: 15
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5)
            ),
            color: buttonBgColor
          ),
          child: Text('Withdraw Now',
            style: TextStyle(
              fontFamily: font,
              color: textColor1
            ),
          ),
        ),
      )
    );
  }
}
