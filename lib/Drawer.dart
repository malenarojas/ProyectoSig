import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

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
