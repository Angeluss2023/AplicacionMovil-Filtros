import 'package:flutter/material.dart';

class NotificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Notificaciones recientes'),
      ),
    );
  }
}
