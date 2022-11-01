import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('componentes '),
        elevation: 0,
      ),
      body: ListView.separated(
       itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.access_time_filled_outlined),
        title: const Text('nombre de la ruta'),
        onTap: () {
          //final route = MaterialPageRoute(
           // builder: (context)=> const listview1Screen());
           final route =MaterialPageRoute(builder: )
          Navigator.push(context, route)
        },
       ),
       separatorBuilder: ( _, __ )=> const Divider(),
       itemCount: 100
       )
    );
  }
}