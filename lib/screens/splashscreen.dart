import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:price_calculator_amul/database/local/initDb.dart';
import '../database/remote/api.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initdb() async {
    await InitDB.instance.database;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initdb();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: Image.asset(
        //     'assets/logo.png',
        //     height: 100,
        //   ),
        // ),
        );
  }
}
