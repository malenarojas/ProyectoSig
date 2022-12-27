import 'package:flutter/material.dart';

class List_view2Screen extends StatelessWidget {
  const List_view2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                //cancelSearch();
              }),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: TextField(
              /*controller: searchController,
          onEditingComplete: () {
            searching();
          },*/
              style: new TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              autofocus: true,
              decoration: InputDecoration(
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    //alignment: Alignment.center,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: AssetImage('images/L001.png'),
                        alignment: Alignment.center,
                        //fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  //const Padding(
                  //  padding: EdgeInsets.all(16.0),
                  //  child: Text('linea 1'),
                  //),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: const AssetImage(
                          'images/L002.png',
                        ),
                        alignment: Alignment.center,
                        //  fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 2'),
                  ),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: AssetImage('images/L005.png'),
                        //fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 2'),
                  ),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: AssetImage('images/L008.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 8'),
                  ),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: AssetImage('images/L009.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 9'),
                  ),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: InkWell(
              onTap: () {},
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: 450.0,
                        height: 350.0,
                        image: AssetImage('images/L010.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 10'),
                  ),
                  const ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: Text('ida'),
                        onPressed: null,
                      ),
                      ElevatedButton(
                        child: Text('vuelta'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
