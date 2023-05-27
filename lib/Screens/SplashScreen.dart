// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playon69/Extra/assets.dart';
import 'package:playon69/Models/UserModel.dart';
import 'package:playon69/Screens/Dashboard.dart';
import 'package:playon69/Screens/MenuScreen.dart';
import 'package:playon69/apis/sharedPreference.dart';
import 'package:playon69/auth/login.dart';
import 'package:provider/provider.dart';

import '../Providers/CurrentUserProvider.dart';
import '../Providers/MathesProvider.dart';
import '../apis/callApi.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // getMatchData() async{
  //   var match = await getMatches1(context, '');
  //   Future.delayed(Duration(seconds: 1),(){
  //     Provider.of<MatchesProvider>(context , listen: false).insert(match); 
  //   });
  // }

  var token;

  @override
  void initState() {
    super.initState();
    getData();
    jumpTo();
  }

  jumpTo(){
    Future.delayed(Duration(seconds: 3),(){
      checkUser();
    });
  }

  getData() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    print(res);
    token = res['token'];
    if(res!=null){
      getMatches1(context, token);
    }else{}
  }

  checkUser() async{
    var res = await retrivePref(method: methods.Maps, key: 'currentUser');
    if(res==null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> Login()));
    }else{
      LoginResponceModel data = LoginResponceModel.fromJson(res);
      Provider.of<CurrentUserProvider>(context,listen: false).insert(data);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> MenuScreen()));
      Fluttertoast.showToast(msg: 'Welcome back');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splash),
              fit: BoxFit.fill
            )
          ),
        ),
      )
    );
  }
}