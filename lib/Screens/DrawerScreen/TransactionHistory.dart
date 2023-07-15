// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, use_build_context_synchronously, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Extra/CommonFunctions.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/transactionistoryModel.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/callApi.dart';

import '../../apis/sharedPreference.dart';

class transactionhistory extends StatefulWidget {
  const transactionhistory({super.key});

  @override
  State<transactionhistory> createState() => _gamehistoryState();
}

class _gamehistoryState extends State<transactionhistory> {

  TransactionHistoryModel? transactionModel;
  bool? isLoading = true;

  @override
  void initState() {
    super.initState();
    getTransactions();
  }

  getTransactions() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    //res['token']
    transactionModel = await getTransactionModel1(context, '4112|jnxLaeqCSzKXRstroV5SfnUCkX4RRwwF1UhzPQk5', res['user_data']['user_name']);
    if(transactionModel!.status==true){
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(
            fontSize: 14,
            fontFamily: font
          )
        ),
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
        icon:ImageIcon(AssetImage(backicon))),
        titleSpacing: -4,
      ),
      body: isLoading==false ? Column(
        children: [
          Container(
            color: appBgColor,
            height: height(context, 0.1),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 8,
                left: 8
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                color: upComingBg
              ),
              child: transactionModel!.transactionHistory!.transaction!.length > 0 ? ListView(
                children: [
                  for(int x=0; x<transactionModel!.transactionHistory!.transaction!.length; x++)
                  transactionTile(transactionModel!.transactionHistory!.transaction![x])
                ],
              ) : Center(
                child: Text('No transactions found!',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 13
                  ),
                ),
              ),
            ),
          ),
        ],
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget transactionTile(Transaction data){
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: tileBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${data.paymentType}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 13,
                  color: textColor2
                ),
              ),
              Row(
                children: [
                  Image.asset(coin,height: 15,),
                  SizedBox(width: 3,),
                  Text('${data.amt}',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 13,
                      color: textColor5
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction Id: ${data.transactionId}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 12,
                  color: textColor4
                ),
              ),
              SizedBox(height: 5,),
              Text('${data.date}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 11,
                  color: textColor4
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
