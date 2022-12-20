import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Drawer.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);


  @override
  State<MapSample> createState() => MapSampleState();
}

List<LatLng> latLen = [];
final Set<Polyline> _polyline = {};


Future<List> loadJson(String fid) async {
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
}



///INICIO

/// FIN



class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  Iterable markers = [];
  Iterable polylines= [];


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 12.4746,
  );

    

  @override
  void initState() {
    
    super.initState();
    getMarkers();
    

  }
  getMarkers() async {
    try {
      final response = await rootBundle.loadString("assets/bdsig.json");
        List<LatLng> latLngPolylines = []; 
        List results = json.decode(response);

        Iterable _polyline = Iterable.generate(results.length, (index) {
          Map result = results[index];
          
          latLngPolylines.add(LatLng(double.parse(result["Lati"]), double.parse(result["Lont"])));
          return Polyline(
            polylineId: const PolylineId('1'),
            points:  latLngPolylines,
            color: Colors.black,
            width: 10,
          );
        });

        setState(() {
          polylines = _polyline;
      
        });
    } catch (e) {}
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-17.7817958, -63.1716228),
      tilt: 59.440717697143555,
      zoom: 12.151926040649414
  );

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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
        ],
      ),
      body: GoogleMap(
        polylines: Set.from(
          polylines,
        ),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          setState(() {});
          _controller.complete(controller);
        },
      ),
      drawer: const DrawerScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Buscar linea'),
        icon: const Icon(Icons.directions_bus_filled_outlined),
      ),
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