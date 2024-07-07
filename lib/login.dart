import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade200,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: 180,
                  height: 40,
                  child: ElevatedButton(onPressed: () async{

                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setBool("Faiz", true);
                    Navigator.pushReplacementNamed(context, "/Home");

                  }, child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white

                    ),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
