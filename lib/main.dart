import 'dart:io';
import 'package:f_rail_vision/widget/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rail Vision',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}