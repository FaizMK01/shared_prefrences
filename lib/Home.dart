import 'package:flutter/material.dart';
import 'package:shared_pref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: TextButton(onPressed: () async{

              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setBool("Faiz", false);


              Navigator.pushReplacementNamed(context, "/Login");
            }, child: Text('Logout'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black26
            ),),
          )
        ],
      ),
     // backgroundColor: Colors.black38,
      body: Center(
        child: Icon(Icons.home_filled,
        color: Colors.red,
        size: 200,),
      ),
    );
  }
}
