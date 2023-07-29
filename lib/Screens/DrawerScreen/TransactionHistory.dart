// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, use_build_context_synchronously, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
    transactionModel = await getTransactionHistory1(context, res['token'], res['user_data']['user_name']);
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
      body: isLoading==false ? Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 8,
          left: 8,
          bottom: 10
        ),
        color: upComingBg,
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
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget transactionTile(Transaction data){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: tileBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width(context, 0.16),
                child: Text('${data.date!}',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 13,
                    color: textColor4
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: borderColor5
                    )
                  )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${data.paymentType}',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: textColor2
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text('${data.transactionId}',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 11,
                      color: textColor4
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(coin,height: 15,),
                  Text(' ${data.debitCreditStatus}₹${data.amt!}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: font,
                      fontSize: 13,
                      color: data.debitCreditStatus=='+' ? textColor3 : textColor5
                    ),
                  )
                ],
              ),
              SizedBox(height: 1,),
              Text('Closing Bal: ${data.closingBalance}',
                style: TextStyle(
                  fontFamily: font,
                  fontSize: 11,
                  color: textColor4
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
