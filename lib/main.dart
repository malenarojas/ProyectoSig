import 'package:flutter/material.dart';
import 'package:flutter_application_2/list_view1.dart';
import 'package:flutter_application_2/Login.dart';
import 'package:flutter_application_2/screens/card_screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ListView1Screen());
  }
}
