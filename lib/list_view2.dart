import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/mapa.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

class List_view2Screen extends StatelessWidget {
  List_view2Screen({Key? key}) : super(key: key);
  List<LatLng> latLen = [];

  Future recorrido(String lineaId, String lineaRe) async {
    return http
        .get(
      Uri.parse("http://sigbus.diagrammer.cfd/api/recorrido/$lineaId/$lineaRe"),
    )
        .then(
      (http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400) {
          throw Exception("Error while fetching data");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: const Icon(Icons.clear), onPressed: () {}),
          title: const Padding(
            padding: EdgeInsets.only(bottom: 10, right: 10),
            child: TextField(
              style: TextStyle(color: Colors.white),
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
                        image: const AssetImage('images/L001.png'),
                        alignment: Alignment.center,
                        //fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  //const Padding(
                  //  padding: EdgeInsets.all(16.0),
                  //  child: Text('linea 1'),
                  //),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(1, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(1, 'V'),
                            ),
                          );
                        },
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
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(2, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(2, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L005.png'),
                        //fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 5'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(5, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(5, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L008.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 8'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(8, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(8, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L009.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 9'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(9, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(9, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L010.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 10'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(10, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(10, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L016.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 16'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(16, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(16, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L017.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 17'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(17, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(17, 'V'),
                            ),
                          );
                        },
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
                        image: const AssetImage('images/L018.png'),
                        //fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('linea 18'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      ElevatedButton(
                        child: const Text('ida'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(18, 'I'),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('vuelta'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSample(18, 'V'),
                            ),
                          );
                        },
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
