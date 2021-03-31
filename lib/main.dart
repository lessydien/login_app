import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/ui/screens/HalamanDepan.dart';
import 'package:login_app/ui/screens/HalamanLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );

}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //int statuslogin=0;
  @override
  void initState() {
    super.initState();
    startTimer();

  }

  void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var statuslogin = (prefs.getInt('statuslogin') ?? 0);

    if (statuslogin != null && statuslogin == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HalamanDepan();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HalamanLogin();
          },
        ),
      );
    }
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            // fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}

