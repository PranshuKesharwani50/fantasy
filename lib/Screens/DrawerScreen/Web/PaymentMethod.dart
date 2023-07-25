
// // // ignore_for_file: unused_local_variable

// // import 'package:flutter/foundation.dart' show kIsWeb;

// // import 'dart:html' as html show window;

// // import 'package:flutter/material.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
// // import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
// // import 'package:flutter_cashfree_pg_sdk/flutter_cashfree_pg_sdk_web.dart';
// // import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
// // import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
// // import 'package:playon69/apis/apis.dart';

// // import '../../../apis/sharedPreference.dart';

// // class PaymentMethod extends StatefulWidget {
// //   PaymentMethod({
// //     this.amt
// //   });

// //   String? amt;

// //   @override
// //   State<PaymentMethod> createState() => _PaymentMethodState();
// // }

// // class _PaymentMethodState extends State<PaymentMethod> {

// //   void initiatePayment() async {
// //     Map<String, dynamic> options = {
// //       "orderId": "ORDER123",
// //       "orderAmount": "100",
// //       "orderNote": "Test payment",
// //       "customerName": "John Doe",
// //       "customerPhone": "9876543210",
// //       "customerEmail": "john.doe@example.com",
// //       "notifyUrl": "https://your-notify-url.com",
// //     };

// //   }

// //   orderId() async{
// //     var res = await retrivePref(method: methods.Maps, key: 'currentUser');
// //     var responce = await createCashFreeOrderId(res['token'], widget.amt!);
// //   }

// //   @override
// //   void initState() {

// //     super.initState();
// //     //cfPaymentGatewayService.setCallback(verifyPayment, onError, receivedEvent);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Plugin example app'),
// //         ),
// //         body: Center(
// //           child: Column(
// //             children: [
// //               // TextButton(onPressed: pay, child: const Text("Pay")),
// //               // TextButton(onPressed: webCheckout, child: const Text("Web Checkout"))
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void verifyPayment(String orderId) {
// //     print("Verify Payment");
// //   }

// //   void onError(errorResponse, String orderId) {
// //     print(errorResponse.getMessage());
// //     print("Error while making payment");
// //   }

// //   void receivedEvent(String event_name, Map<dynamic, dynamic> meta_data) {
// //     print(event_name);
// //     print(meta_data);
// //   }

// //   // String orderId = "order_18482OugsYDr411Aj2DzDrJP8g8Q4k6";
// //   // String paymentSessionId = "session_6U02SnmsBos4Ym2QRxkLQ9dS3HiB-XeQe9C__NZxFwGtsVtGUTPVX5iA9x5EdhTPnXXZxo7NHJeBSPDSshPqSdu88_3QSbD59S4ris1BIHAv";

// // }

// // ignore_for_file: must_be_immutable

// import 'package:cashfree_pg/cashfree_pg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cashfree_pg_sdk/flutter_cashfree_pg_sdk_web.dart';

// import '../../../apis/apis.dart';
// import '../../../apis/sharedPreference.dart';

// class PaymentMethod extends StatefulWidget {
//   PaymentMethod({
//     this.amt
//   });

//   String? amt;

//   @override
//   State<PaymentMethod> createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<PaymentMethod> {

//   Cashfree? cash;

//   void verifyPayment(String orderId) {
//     print("Verify Payment");
//   }

//   void onError(errorResponse, String orderId) {
//     print(errorResponse.getMessage());
//     print("Error while making payment");
//   }

//   void receivedEvent(String event_name, Map<dynamic, dynamic> meta_data) {
//     print(event_name);
//     print(meta_data);
//   }

//   void initiatePayment() async {

//     Map<String, dynamic> options = {
//       "orderId": "ORDER123",
//       "orderAmount": "100",
//       "orderNote": "Test payment",
//       "customerName": "John Doe",
//       "customerPhone": "9876543210",
//       "customerEmail": "john.doe@example.com",
//       "notifyUrl": "https://your-notify-url.com",
//     };
//     CashfreePGSDK.doPayment(options);
//   }

//   orderId() async{
//     var res = await retrivePref(method: methods.Maps, key: 'currentUser');
//     var responce = await createCashFreeOrderId(res['token'], widget.amt!);
//   }

//   @override
//   void initState() {
    
//     super.initState();
//     CashfreePGSDK.doPayment(inputParams)
//         .then((value) => value?.forEach((key, value) {
//               print("$key : $value");
//               //Do something with the result
//             }));
//     //initiatePayment();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Text('Please-wait...'),
//         )
//       ),
//     );
//   }
// }