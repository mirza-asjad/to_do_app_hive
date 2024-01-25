import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app_hive/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    super.initState();


    Timer(const Duration(seconds: 2), () {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const HomePage(),
  ));
});

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Image.asset('images/abc.png'),
        ),
      ),
    );
  }
}
