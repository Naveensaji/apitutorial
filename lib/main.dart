import 'dart:io';

import 'package:apisample/HomeScreen.dart';
import 'package:apisample/d.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:const HomeScreen() ,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
