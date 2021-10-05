import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'pages/homescreen.dart';
import 'pages/side.dart';


void main() {
  runApp( const MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [

          DrawerScreen(),
            HomeScreen(),
        ],
      ),
    );
  }
}

