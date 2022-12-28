//import 'dart:html';

import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.map_sharp), text: 'Mapa'),
              Tab(icon: Icon(Icons.face), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
          elevation: 100,
          titleSpacing: 20,
        ),
        //drawer: const _Drawer(),
        body: const TabBarView(
          children: [
            Center(
              child: Text("home"),
            ),
            Center(
              child: Text("mapa"),
            ),
            Center(
              child: Text("Profile"),
            ),
            Center(
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 99, 206, 241),
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _ListTile(
            titulo: 'Message',
            icono: Icons.message,
          ),
          _ListTile(
            titulo: 'Profile',
            icono: Icons.account_circle,
          ),
          _ListTile(
            titulo: 'Settings',
            icono: Icons.settings,
          ),
        ],
      ),
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
