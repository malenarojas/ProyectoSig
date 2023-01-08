import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Drawer.dart';
import 'package:flutter_application_2/list_view2.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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
  List<dynamic> polylines = [];
  Iterable polylines2 = [];



  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> Polylines = {};
  LatLng startLocation = const LatLng(-17.779524, -63.172542);  
  LatLng endLocation = const LatLng(-17.778195, -63.165161); 
  static const LatLng _center = LatLng(-17.778943, -63.168997);
  List<LatLng> polylineCoordinates = [];
  String googleAPiKey = "AIzaSyB4DX_UdO_V3a5rua6VdmFbuPXmyLHz6Oo";





  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 12.4746,
  );

  @override
  void initState() {

getDirections();


    super.initState();



    
  }

  getDirections() async {
      List<LatLng> polylineCoordinates = [];
     
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey,
          PointLatLng(startLocation.latitude, startLocation.longitude),
          PointLatLng(endLocation.latitude, endLocation.longitude),
          travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
            result.points.forEach((PointLatLng point) {
                polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            });
      } else {
         print(result.errorMessage);
      }
      addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    Polylines[id] = polyline;
    setState(() {});
  }



//Función que permite obtener la ruta óptima
  Future<dynamic> getPlan(String lontinicio, String latiinicio, String lontfin,String latifin) async {
    dynamic url =
        "http://sigbus.diagrammer.cfd/api/fin/$lontinicio/$latiinicio/$lontfin/$latifin";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        List results = json.decode(response.body);
        List<LatLng> latLngPolylines = [];
//Iterable permite recorrer todos los datos de la API para graficar
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
          polylines = latLngPolylines;
        });
      }
    }
  }

//Muestra el recorrido de una sola línea, ya sea ida o vuelta
  Future<dynamic> getRecorrido(
      String lineaId, String lineaRe, int lineaCol) async {
    dynamic url =
        "http://sistemageografico.tonker.net/mapsig/public/api/recorrido/$lineaId/$lineaRe";
    var response = await http.get(Uri.parse(url));
//Nos permite obtener el color
    dynamic colorUrl =
        "http://sigbus.diagrammer.cfd/api/color/$lineaId/$lineaRe";
 /*    var responseColor = await http.get(Uri.parse(colorUrl)); */



    Color test = Color(lineaCol);
    if (response.statusCode == 200) {
      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        List results = json.decode(response.body);
        List<LatLng> latLngPolylines = [];

        for (var i = 0; i < results.length; i++) {
          Map result = results[i];
          String lati = result["Lati"];
          String lont = result["Lont"];
          lont = lont.replaceAll('-63,', '-63.');
          lati = lati.replaceAll('-17,', '-17.');

          if (result['PuntoD'] == 0) {
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
        }

        setState(() {
          polylines = latLngPolylines;
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
  List markerLongLat = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          getRecorrido(
            widget.index.toString(),
            widget.recorrido.toString(),
            widget.lineaCol,
          ),
        ]),
        builder: (context, items) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Planificador de viajes'),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 99, 206, 241),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
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
              polylines: Set<Polyline>.of(Polylines.values),
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onTap: _handleTap,
              markers: Set.from(markerAll),
              onMapCreated: (GoogleMapController controller) {
                setState(() {});
                _controller.complete(controller);
              },
            ),
            drawer: DrawerScreen(),
            //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => List_view2Screen()),
                    );
                  },
                  label: const Text('Buscar linea'),
                  icon: const Icon(Icons.directions_bus_filled_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                /* FloatingActionButton.extended(
            label: const Text('+'),
            icon: const Icon(Icons.account_box_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                        title: Text("Hola"),
                      ));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            label: const Text('+'),
            icon: const Icon(Icons.account_tree_sharp),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                        title: Text("Adios"),
                      ));
            },
          ),
          const SizedBox(
            height: 100,
          ),*/
              ],
            ),
          );
        });
  }

  _handleTap(LatLng tappedPoint) async {
    LatLng tappedPointAux;
    LatLng tappedPointAux2;

    var lontinicio;
    var data = "L008V";
    var latiinicio;
    var distancia = "4,2KM";
    var lontfin;
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

    if (markerAll.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text("Planifica tu viaje"),
          content: Text(
              "El primer(1er) Tap indicará tu punto de salida, y el segundo Tap (2do) el de llegada. Permitenos ayudarte a tener un buen viaje."),
        ),
      );
    }
    setState(
      () {
        if (markerAll.isEmpty) {
          markerAll.add(
            Marker(
              markerId: MarkerId(
                tappedPoint.toString(),
              ),
              position: tappedPoint,
            ),
          );
          markerLongLat.add(tappedPoint.longitude.toString());
          markerLongLat.add(tappedPoint.latitude.toString());
        } else {
          if (markerAll.length >= 2) {
            markerAll = [];
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
/*
  // Posicion inicial -17.7817958,-63.1716228
  posicion.Latitude := -17.7817958;
  posicion.Longitude := -63.1716228;
  MapView1.Location := posicion;
  MapView1.Zoom := 12;
*/