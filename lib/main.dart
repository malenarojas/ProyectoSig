import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/screens.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: const CardScreen(),
      initialRoute: 'home',
      routes: {
        'home':( BuildContext context) => const HomeScreen(),
        'Listview1':( BuildContext context) => const listview1Screen(),
        'Listview2':( BuildContext context) => const listview2Screen(),
        'alert':( BuildContext context) => const  AlertScreen(),
        'card':( BuildContext context) => const CardScreen(),

      },
      onGenerateRoute: (settings) => {
        print(settings);
      },
    );
  }
}