import 'package:flutter/material.dart';

class NotificacionesPage extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> notificacionesFuture;

  NotificacionesPage({required this.notificacionesFuture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: notificacionesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar notificaciones'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay notificaciones'));
          }

          final notificaciones = snapshot.data!;
          return ListView(
            children: [
              _buildSeccionTitulo('Nuevas'),
              ...notificaciones
                  .where((n) => n['nuevo'] == true)
                  .map((n) => _buildNotificacion(n)),
              Divider(color: Colors.grey),
              _buildSeccionTitulo('Últimos 7 días'),
              ...notificaciones
                  .where((n) => n['nuevo'] == false)
                  .map((n) => _buildNotificacion(n)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSeccionTitulo(String titulo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        titulo,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildNotificacion(Map<String, dynamic> data) {
    return ListTile(
      leading: data['imagen'] != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(data['imagen']),
            )
          : Icon(
              data['icono'] ?? Icons.notifications,
              color: data['nuevo'] ? Colors.blue : Colors.grey,
            ),
      title: Text(
        data['usuario'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(data['detalle']),
      trailing: data['tipo'] == 'follow'
          ? ElevatedButton(
              onPressed: () {},
              child: Text('Seguir'),
            )
          : null,
    );
  }
}
