// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:playon69/Extra/AppTheme.dart';
import 'package:playon69/Providers/CurrentUserProvider.dart';
import 'package:playon69/Providers/TimerProvider.dart';
import 'package:playon69/Providers/newContestStatusProvider.dart';
import 'package:playon69/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'Providers/MatchContestProvider.dart';
import 'Providers/MathesProvider.dart';
import 'Providers/myTeamProvider.dart';
import 'Providers/playersProvider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: notificationPanelColor
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
        ChangeNotifierProvider(create: (_) => MatchesProvider()),
        ChangeNotifierProvider(create: (_) => matchContestProvider()),
        ChangeNotifierProvider(create: (_) => PlayersProvider()),
        ChangeNotifierProvider(create: (_) => myTeamProvider()),
        ChangeNotifierProvider(create: (_) => NewContestStatusProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PlayOn69',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()
      ),
    );
  }
}