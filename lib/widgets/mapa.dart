import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Drawer.dart';
import 'package:flutter_application_2/list_view2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';
import 'package:http/http.dart' as http;

class MapSample extends StatefulWidget {
  var index;
  var recorrido;
  MapSample(this.index, this.recorrido);

  @override
  State<MapSample> createState() => MapSampleState();
}

List<LatLng> latLen = [];
final Set<Polyline> _polyline = {};

/* Future<List> loadJson(String fid) async {
  final response = await rootBundle.loadString("assets/bdsig.json");

//
  var jsonResult = json.decode(response);
/*   for (var i = 0; i < 4000; i++) {
    if(jsonResult[i]['code']=='L001I'){
      latLen.add(LatLng(double.parse(jsonResult[i]["Lont"]), double.parse(jsonResult[i]["Lati"])));
    }
  }
    _polyline.add(
          Polyline(
            polylineId: const PolylineId('1'),
            points:  latLen,
            color: Colors.black,
            width: 200,
          )
      ); */

  return jsonResult;
} */

///INICIO

/// FIN

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  Iterable markers = [];
  Iterable polylines = [];

  // ignore: constant_identifier_names
  static const CameraPosition _PosicionInicial = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 14.4746,
    bearing: 10.8334901395799,
    tilt: 79.440717697143555,
  );

  @override
  void initState() {
    super.initState();
  }

  recorrer(String lineaId, String lineaRe) async {
    dynamic url =
        "http://sistemageografico.tonker.net/mapsig/public/api/recorrido/$lineaId/$lineaRe";
    var response = await http.get(Uri.parse(url));
    List results = json.decode(response.body);
    List<LatLng> latLngPolylines = [];

    for (var i = 0; i < results.length; i++) {
      Map result = results[i];
      String lati = result["Lati"];
      String lont = result["Lont"];
      lont = lont.replaceAll('-63,', '-63.');
      lati = lati.replaceAll('-17,', '-17.');
      latLngPolylines.add(LatLng(double.parse(lati), double.parse(lont)));

      //print(i);

      if (lineaRe == 'V') {
        _polyline.add(Polyline(
          polylineId: const PolylineId('1'),
          points: latLngPolylines,
          color: Colors.green,
          width: 2,
        ));
      } else {
        _polyline.add(Polyline(
          polylineId: const PolylineId('1'),
          points: latLngPolylines,
          color: Colors.black,
          width: 2,
        ));
      }
    }
    setState(() {
      polylines = _polyline;
    });
  }

  getMarkers(String url) async {
    final response = await http.get(Uri.parse(
        "http://sistemageografico.tonker.net/mapsig/public/api/recorridos/1"));

    final int statusCode = response.statusCode;

    if (statusCode == 201 || statusCode == 200) {
      List results = json.decode(response.body);
      List<LatLng> latLngPolylines = [];

      Iterable _polyline = Iterable.generate(results.length, (index) {
        Map result = results[index];
        String lati = result["Lati"];
        String lont = result["Lont"];
        lont = lont.replaceAll('-63,', '-63.');
        lati = lati.replaceAll('-17,', '-17.');

        bool isInsideRadius2(
            double currentX, double currentY, double lineX, double lineY) {
          const double radius = 0.002355222456223941; // 250 metros
          double d = sqrt(pow((lineX.abs() - currentX.abs()), 2) +
              pow((lineY.abs() - currentY.abs()), 2));
          return (d <= radius);
        }

        latLngPolylines.add(LatLng(double.parse(lati), double.parse(lont)));

        return Polyline(
          polylineId: const PolylineId('1'),
          points: latLngPolylines,
          color: Colors.green,
          width: 2,
        );
      });

      setState(() {
        polylines = _polyline;
      });
    }
  }

  static const CameraPosition _posicionMapaInicial = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-17.7817958, -63.1716228),
      tilt: 59.440717697143555,
      zoom: 12.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planificador de viajes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 99, 206, 241),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              recorrer('8', 'V');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        polylines: Set.from(
          polylines,
        ),
        mapType: MapType.normal,
        initialCameraPosition: _PosicionInicial,
        onMapCreated: (GoogleMapController controller) {
          setState(() {});
          _controller.complete(controller);
        },
      ),
      drawer: const DrawerScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          btCentrar(),
          SizedBox(
            height: 20,
          ),
          btPartida(),
          SizedBox(
            height: 20,
          ),
          bt_Llegada(),
          SizedBox(
            height: 20,
          ),
          button_buscar(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Future<void> _centrarMapa() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_posicionMapaInicial));
  }
}

class _ListTile extends StatelessWidget {
  final String titulo;
  final icono;
  const _ListTile({
    Key? key,
    required this.titulo,
    required this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icono),
      title: Text(titulo),
    );
  }
}

class bt_Llegada extends StatelessWidget {
  const bt_Llegada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: FloatingActionButton.extended(
        heroTag: 'btAdios',
        label: const Text('+'),
        icon: const Icon(Icons.sports_score),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text("Adios"),
                  ));
        },
      ),
    );
  }
}

class btPartida extends StatelessWidget {
  const btPartida({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: FloatingActionButton.extended(
        heroTag: 'btHola',
        label: const Text('+'),
        icon: const Icon(Icons.directions_walk),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text("Marcar"),
                  ));
        },
      ),
    );
  }
}

class btCentrar extends StatelessWidget {
  const btCentrar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: FloatingActionButton.extended(
        heroTag: 'btCentar',
        label: const Text(''),
        icon: const Icon(Icons.center_focus_strong),
        onPressed: () {},
      ),
    );
  }
}

class button_buscar extends StatelessWidget {
  const button_buscar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: FloatingActionButton.extended(
        heroTag: 'btBuscar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => List_view2Screen()),
          );
        },
        label: const Text('Buscar micros'),
        icon: const Icon(Icons.directions_bus_filled_outlined),
      ),
    );
  }
}
