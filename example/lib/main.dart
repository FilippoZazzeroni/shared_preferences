

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref/models/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.instance.initialize();
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: () {
            //SharedPreferences.instance.set(value: false, key: "isLogged");
            final isLogged = SharedPreferences.instance.get(key: "isLogged");
            if (kDebugMode) {
              print(isLogged);
            }
          }, child: const Text("save"))
        ],
      ),
    );
  }
}
