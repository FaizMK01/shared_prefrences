import 'package:flutter/material.dart';
import 'package:shared_pref/ScreenTwo.dart';

class ScreenOne extends StatefulWidget {
  @override
  State<ScreenOne> createState() => ScreenOneState();
}

class ScreenOneState extends State<ScreenOne> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("ScreenOne"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: TextField(
              controller: controller,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/ScreenTwo",
                    arguments: controller.text);
              },
              child: const Text("Screen Two"))
        ],
      ),
    );
  }
}
