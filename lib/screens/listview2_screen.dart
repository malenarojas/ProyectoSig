import 'package:flutter/material.dart';

class listview2Screen extends StatelessWidget {

  final options =const['Megaman','Metal Gear', 'Super Smash' , 'Final Fantasy'];
   
  const listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Listview tipo 2'),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
      itemBuilder: (context, i) => ListTile(
            title: Text(options[i]),
            trailing: const Icon(Icons.arrow_back_outlined, color: Colors.indigo,),
            onTap: (){
              final game = options[i];
              print(game);
            },
          ),
      separatorBuilder: ( _ , __)=> const Divider(),
      itemCount: options.length
      ),
    );
  }
}

