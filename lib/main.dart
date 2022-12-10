import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/list_view1.dart';
<<<<<<< HEAD
//import 'package:flutter_application_2/screens/card_screens.dart';
=======

>>>>>>> bc751b5dc63a25244fbea2f2d579a8035be34dbb

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeScreen());
  }
}
