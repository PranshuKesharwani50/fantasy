import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/apis/apis.dart';
import 'package:playon69/apis/callApi.dart';

import '../../../Models/orderIdModel.dart';
import '../../../apis/sharedPreference.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({
    this.amt
  });

  String? amt;


  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  OrderIdModel? data;

  createOrderId() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    OrderIdModel responce = await createCashFreeOrderId1(res['token'], widget.amt!);
    if(responce.status==true){
      generateToken(responce);
      //initializedPayment(responce);
      // setState(() {
      //   data = responce;
      // });
    }else{
      Fluttertoast.showToast(msg: responce.message!);
    }
  }

  // void launch(){
  //   Future.delayed(Duration(seconds: 3),(){
  //     initializedPayment();
  //   });
  // }

  generateToken(OrderIdModel data) async{

    var responce = await generatePaymentToke(
      cfKey: data.cashFreeApiKey!.apiKey,
      cfSecret: data.cashFreeApiKey!.appSecretKey,
      currency: 'INR',
      amount: widget.amt,
      orderId: data.cfOrderId
    );
    if(responce['status']=='OK'){
      initializedPayment(data,responce);
    }else{
      Fluttertoast.showToast(msg: responce['message']);
    }
    

  }

  initializedPayment(OrderIdModel data,var data2) {
    //Navigator.of(context).pop();
    //var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    print(data.cashFreeApiKey!.apiKey!);
    print(data.orderId!);

    Map<String, String> inputParams = {
      "orderId": data.orderId!,
      "orderAmount": widget.amt!,
      "customerName": "Demo",
      "orderCurrency": "INR",
      "appId": data.cashFreeApiKey!.apiKey!,
      "customerPhone": "1234567890",
      "customerEmail": "Demo@demo.com",
      "stage": "PROD",
      "tokenData": data2['cftoken'],
      // "orderNote": orderNote,
      // "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doPayment(inputParams)
    .then((value) => value?.forEach((key, value) {
      print("responce : $key : $value");
      //Do something with the result
    }));

  }

  @override
  void initState() {
    super.initState();
    createOrderId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Please-wait...'),
      )
    );
  }
}