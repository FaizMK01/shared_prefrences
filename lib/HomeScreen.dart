import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controller = TextEditingController();

  String value = '';

  Future<void> savedValue() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("Name", controller.text);

    setState(() {
      controller.clear();
      getValue();
    });
  }

  Future<void> getValue() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var get = sp.getString("Name");
    value = get ?? 'No Value Saved.';

    setState(() {

    });
  }

@override
  void initState() {
    getValue();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shared Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            const SizedBox(
              height: 30,
            ),
             Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 190,
              child: ElevatedButton(
                onPressed: savedValue,
                child: Text(
                  'Saved',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
