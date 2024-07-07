import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref/Home.dart';
import 'package:shared_pref/ScreenOne.dart';
import 'package:shared_pref/ScreenTwo.dart';
import 'package:shared_pref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ScreenOne screenOne = ScreenOne();
    ScreenOneState screenOneState = ScreenOneState();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenOne(),
      routes: {
        '/Home': (context) => const Home(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/Login': (context) => const LoginScreen(),
        '/ScreenTwo': (context) => ScreenTwo(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyAppState();
}

class _MyAppState extends State<SplashScreen> {
  @override
  void initState() {
    whereTo();
    super.initState();
  }

  Future<void> whereTo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var isLogged = sp.getBool("Faiz");

    Future.delayed(Duration(seconds: 2), () {
      if (isLogged != null) {
        if (isLogged) {
          Navigator.pushReplacementNamed(context, '/Home');
        } else {
          Navigator.pushReplacementNamed(context, '/Login');
        }
      } else {
        Navigator.pushReplacementNamed(context, '/Login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          child: Icon(
            Icons.heart_broken_sharp,
            color: Colors.red,
            size: 200,
          ),
        ),
      ),
    );
  }
}
