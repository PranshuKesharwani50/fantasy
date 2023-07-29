// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_unity/flutter_unity.dart';
// import 'package:playon69/apis/sharedPreference.dart';

// class GameScreen extends StatefulWidget {
//   GameScreen({
//     required this.gameType
//   });

//   int? gameType;

//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   UnityViewController? unityViewController;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   static const platform = MethodChannel('unity_view');
  
//   Future<void> sendUserIdAndGameType() async {
//     /*
//     classic = 1,
//     quick-ludo = 2,
//     1 goti-ludo = 3,
//     snack-ladder = 4
//     */
//     var res = await retrivePref(method: methods.Maps, key: 'currentUser');
//     print(res);

//     try {
//       await platform.invokeMethod('setUserTokenAndCoins', {
//         'user_id': res['user_data']['user_name'],
//         'game_type': widget.gameType,
//       });
//     } on PlatformException catch (e) {
//       print("Failed to send user_id and game_type to Unity: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: UnityView(
//         onCreated: onUnityViewCreated,
//         onReattached: onUnityViewReattached,
//         onMessage: onUnityViewMessage,
//       ),
//     );
//   }

//   void onUnityViewCreated(UnityViewController? controller){
//     print('onUnityViewCreated');

//     //unityViewController = controller;
//     sendUserIdAndGameType();
    
//   }

//   void onUnityViewReattached(UnityViewController controller) {
//     print('onUnityViewReattached');
//   }

//   void onUnityViewMessage(UnityViewController controller, String? message) {
//     print('onUnityViewMessage');

//     print(message);
//   }
// }