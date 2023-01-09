import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Drawer.dart';
import 'package:flutter_application_2/list_view2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';
import 'package:http/http.dart' as http;

class MapSample extends StatefulWidget {
  var index;
  var recorrido;
  var lineaCol;
  var lontinicio;
  var latiinicio;
  var lontfin;
  var latifin;
  MapSample(this.index, this.recorrido, this.lineaCol);

  @override
  State<MapSample> createState() => MapSampleState();
}

List<LatLng> latLen = [];
final Set<Polyline> _polyline = {};

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  Iterable markers = [];
  Iterable polylines = [];
  Iterable polylines2 = [];

  static const CameraPosition _PosicionInicial = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 14.4746,
  );

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 12.4746,
  );

  @override
  void initState() {
    recorrer(
      widget.index.toString(),
      widget.recorrido.toString(),
      widget.lineaCol,
    );
    super.initState();
  }

 

  getplan(String lontinicio, String latiinicio, String lontfin,
      String latifin) async {

    dynamic url =
        "http://sistemageografico.tonker.net/mapsig/public/api/fin/$lontinicio/$latiinicio/$lontfin/$latifin";
    var response = await http.get(Uri.parse(url));
        List<LatLng> latLngPolylines = [];
    if (response.statusCode == 200) {
      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        List results = json.decode(response.body);
    

        Iterable _polyline = Iterable.generate(results.length, (index) {
          Map result = results[index];
          String lati = result["Lati"];
          String lont = result["Lont"];
          lont = lont.replaceAll('-63,', '-63.');
          lati = lati.replaceAll('-17,', '-17.');

          latLngPolylines.add(LatLng(double.parse(lati), double.parse(lont)));
          return Polyline(
            polylineId: const PolylineId('2'),
            points: latLngPolylines,
            color: Colors.black,
            width: 2,
          );
        });
        setState(() {
          polylines = _polyline;
        });
      }
    }
  }

  recorrer(String lineaId, String lineaRe, int lineaCol) async {
    dynamic url = "http://sistemageografico.tonker.net/mapsig/public/api/recorrido/$lineaId/$lineaRe";
    Color test = Color(lineaCol);
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

      if (lineaRe == 'V') {
        _polyline.add(Polyline(
          polylineId: const PolylineId('1'),
          points: latLngPolylines,
          color: test,
          width: 2,
        ));
      } else {
        _polyline.add(Polyline(
          polylineId: const PolylineId('1'),
          points: latLngPolylines,
          color: test,
          width: 2,
        ));
      }
    }
    setState(() {
      polylines = _polyline;
    });
  }

//Función que permite obtener la ruta óptima
  Future<dynamic> getPlan(String lontinicio, String latiinicio, String lontfin,
      String latifin) async {
    dynamic url =
        "http://sistemageografico.tonker.net/mapsig/public/api/$lontinicio/$latiinicio/$lontfin/$latifin";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
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

          latLngPolylines.add(LatLng(double.parse(lati), double.parse(lont)));

          return Polyline(
            polylineId: const PolylineId('2'),
            points: latLngPolylines,
            color: Colors.black,
            width: 2,
          );
        });
        setState(() {
          polylines = _polyline;
        });
      }
    }
  }

  Future<dynamic> getRecorrido(
      String lineaId, String lineaRe, int lineaCol) async {
    List<LatLng> latLngPolylines = [];
    Color test = Color(lineaCol);

    dynamic url =
        "http://sistemageografico.tonker.net/mapsig/public/api/recorrido/$lineaId/$lineaRe";
    if (dart == true) {
      return null;
    }
    var response = await http.get(Uri.parse(url));
    dynamic colorUrl =
        "http://sigbus.diagrammer.cfd/api/color/$lineaId/$lineaRe";
    /*   var responseColor = await http.get(Uri.parse(colorUrl)); */

    if (response.statusCode == 200) {
      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        List results = json.decode(response.body);

        Iterable _polyline = Iterable.generate(results.length - 1, (index) {
          Map result = results[index];
          String lati = result["Lati"];
          String lont = result["Lont"];
          lont = lont.replaceAll('-63,', '-63.');
          lati = lati.replaceAll('-17,', '-17.');
          dart = true;
          if (double.parse(result['Distancia'].replaceAll(',', '.')) == 0) {
          } else {
            latLngPolylines.add(LatLng(double.parse(lati), double.parse(lont)));
            if (lineaRe == 'V') {
              return Polyline(
                polylineId: const PolylineId('1'),
                points: latLngPolylines,
                color: test,
                width: 2,
              );
            } else {
              return Polyline(
                polylineId: const PolylineId('2'),
                points: latLngPolylines,
                color: test,
                width: 2,
              );
            }
          }
        });
      }
    }
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-17.7817958, -63.1716228),
      tilt: 59.440717697143555,
      zoom: 12.151926040649414);

  List<Marker> markerAll = [];
  bool dart = false;
  List markerLongLat = [];

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
              getplan(
                  widget.lontinicio.toString(),
                  widget.latiinicio.toString(),
                  widget.lontfin.toString(),
                  widget.latifin.toString());
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
        onTap: _handleTap,
        markers: Set.from(markerAll),
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

  _handleTap(LatLng tappedPoint) async {
    LatLng tappedPointAux;
    LatLng tappedPointAux2;

    var lontinicio;
    var data = "L008V";
    var latiinicio;
    var distancia = "4,2KM";
    var lontfin ;
    var latifin;

    // ignore: unrelated_type_equality_checks
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
          targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();
    }

    final Uint8List markerIcon =
        await getBytesFromAsset('images/flag.png', 150);

    if (markerAll.isEmpty) {}
    setState(
      () {
        if (markerAll.isEmpty) {
          markerAll.add(
            Marker(
                markerId: MarkerId(
                  tappedPoint.toString(),
                ),
                position: tappedPoint,
                draggable: true),
          );
          markerLongLat.add(tappedPoint.longitude.toString());
          markerLongLat.add(tappedPoint.latitude.toString());
        } else {
          if (markerAll.length >= 2) {
            markerAll = [];
            setState(() {
              recorrer(
                widget.index.toString(),
                widget.recorrido.toString(),
                widget.lineaCol
              );
              markerLongLat.clear();
            });

          } else {
            markerAll.add(Marker(
              markerId: MarkerId(
                tappedPoint.toString(),
              ),
              icon: BitmapDescriptor.fromBytes(markerIcon),
              position: tappedPoint,
            ));
            tappedPointAux2 = tappedPoint;
            markerLongLat.add(tappedPoint.longitude.toString());
            markerLongLat.add(tappedPoint.latitude.toString());

            lontinicio = markerLongLat[0].toString();
            latiinicio = markerLongLat[1].toString();
            lontfin = markerLongLat[2].toString();
            latifin = markerLongLat[3].toString();

            getplan(lontinicio, latiinicio, lontfin, latifin);



            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text("DESCRIPCIÓN: "),
                      content: SingleChildScrollView(
                        child: Card(
                          child: Text("El micro que se debe tomar es: " + data),
                          // ignore: prefer_const_literals_to_create_immutables
                        ),
                      ),
                    ));

          }
        }
      },
    );
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
