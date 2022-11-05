import 'package:flutter/material.dart';

class _ListTile extends StatelessWidget {
  final String titulo;
  var icono;
  _ListTile({
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
