// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Screens/DrawerScreen/Web/PaymentMethod.dart';
import 'package:playon69/Screens/DrawerScreen/Web/paymentWebViewScreen.dart';
import 'package:playon69/customs/CustomTextField.dart';

import '../../Models/walletModel.dart';
import '../../apis/callApi.dart';
import '../../apis/sharedPreference.dart';

class addcash extends StatefulWidget {
  const addcash({super.key});

  @override
  State<addcash> createState() => _addcashState();
}

class _addcashState extends State<addcash> {

  List<int> price = [100, 200, 500, 1000];
  int index = 0;

  String? userId;
  WalletModel? walletModel;
  bool isLoading = true;
  
  getUser() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    userId = res['user_data']['user_name'];
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
  void initState() {
    super.initState();
    getUser();
    getWallet();
  }

  TextEditingController amt = TextEditingController(text: '0.0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Cash',
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
      body: isLoading == false ? Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Total Available Balance',
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
                        Text('${walletModel!.walletInfo!.walletAmount}',
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
                    label: 'Amount to add', 
                    widget: TextFormField(
                      validator: (data){
                        if(data==null){
                          return 'Amount to add';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //prefix: Image.asset(coin,height: 20,),
                        border: InputBorder.none,
                        hintText: 'Amount to add',
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
                      Text('(Rs. 25 to Rs. 10,000)',
                        style: TextStyle(
                          fontFamily: font,
                          color: textColor4,
                          fontSize: 11
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Or Select one of the amounts from below',
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
                  Text('Use UPI/Bank Transfer when you withdraw more then Rs.',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 12,
                      color: textColor4
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for(int x=0; x<price.length; x++)
                      InkWell(
                        onTap: (){
                          amt.text = price[x].toString();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: tileBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5)
                            )
                          ),
                          child: Row(
                            children: [
                              Image.asset(coin,height: 15,),
                              SizedBox(width: 10,),
                              Text('${price[x]}',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 14,
                                  color: textColor2
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Container(
                          width: width(context, 0.35),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: tileBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ),
                            border: Border.all(
                              width: 2,
                              color: index==0 ? borderColor2 : borderColor
                            )
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(upi),
                              SizedBox(height: 10,),
                              Text('Pay Using UPI',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 14,
                                  color: textColor2
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Container(
                          width: width(context, 0.35),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: tileBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ),
                            border: Border.all(
                              width: 2,
                              color: index==1 ? borderColor2 : borderColor
                            )
                          ),
                          child: Column(
                            children: [
                              Image.asset(creditCard,
                                height: 30,
                              ),
                              SizedBox(height: 5,),
                              Text('Credit/Debit Card',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 14,
                                  color: textColor2
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ) : Center(child: CircularProgressIndicator()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: (){
          if(index==0){
            print(userId);
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => PaymentWebviewScreen(title: 'UPI Payment',endPoint: 'externalUpiPayment?user_id=$userId&amount=${amt.text}',)));
          }else{
            //Navigator.push(context, MaterialPageRoute(builder: (ctx) => PaymentMethod()));
          }
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
          child: Text('Pay Now',
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
