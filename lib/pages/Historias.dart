import 'package:flutter/material.dart';

class HistoriasPage extends StatelessWidget {
  final List<Map<String, dynamic>> historias = [
    {'usuario': 'Usuario 1', 'imagen': 'assets/images/sample1.jpg'},
    {'usuario': 'Usuario 2', 'imagen': 'assets/images/sample2.jpg'},
    {'usuario': 'Usuario 3', 'imagen': 'assets/images/sample3.jpg'},
    {'usuario': 'Usuario 4', 'imagen': 'assets/images/sample4.jpg'},
    {'usuario': 'Usuario 5', 'imagen': 'assets/images/sample5.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1AA6B7),
        title: Text(
          'Historias',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            "Agregar una historia",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF002D40),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Aquí puedes implementar la funcionalidad de la cámara o selección de imágenes
              },
              icon: Icon(Icons.camera_alt, color: Colors.white),
              label: Text(
                "Abrir cámara o galería",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF56A79),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: historias.length,
              itemBuilder: (context, index) {
                final historia = historias[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(historia['imagen']),
                    radius: 25,
                  ),
                  title: Text(
                    historia['usuario'],
                    style: TextStyle(fontSize: 16, color: Color(0xFF002D40)),
                  ),
                  onTap: () {
                    // Implementa la visualización de historias aquí
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
