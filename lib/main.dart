import 'package:flo_works/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Home Screen',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

