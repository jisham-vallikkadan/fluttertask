import 'package:flutter/material.dart';
import 'package:fluttertask/screens/adddriver.dart';
import 'package:fluttertask/screens/buslist.dart';
import 'package:fluttertask/screens/driverlist.dart';
import 'package:fluttertask/screens/loginpage.dart';
import 'package:fluttertask/screens/pageone.dart';
import 'package:fluttertask/screens/test.dart';

import 'package:fluttertask/service/providerclass.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> FluttertaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Loginpage(),
      ),
    );
}
  }
