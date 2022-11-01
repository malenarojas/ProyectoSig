import 'package:flutter/material.dart';

class listview1Screen extends StatelessWidget {

  final options =const['Megaman','Metal Gear', 'Super Smash' , 'Final Fantasy'];
   
  const listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Listview tipo 1'),
      ),
      body: ListView(
        children: [
          ...options.map((game) => ListTile(
            title: Text(game),
            trailing: Icon(Icons.arrow_back_outlined),
          ),
          ).toList(),
        ],
      )
    );
  }
}

