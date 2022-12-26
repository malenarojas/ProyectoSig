import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Drawer.dart';
import 'package:flutter_application_2/list_view2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7817958, -63.1716228),
    zoom: 12.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
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
        backgroundColor: Color.fromARGB(255, 99, 206, 241),
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
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      drawer: DrawerScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(context,MaterialPageRoute(builder: (context)=>List_view2Screen()), );
        },
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