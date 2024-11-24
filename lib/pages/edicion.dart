import 'package:flutter/material.dart';
import 'dart:io';

class EdicionPage extends StatelessWidget {
  final String imagePath;

  EdicionPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar publicación'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.blue),
            onPressed: () {
              // Aquí puedes manejar el guardado o la siguiente acción
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: imagePath.isNotEmpty
                ? Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Center(
                    child: Icon(Icons.image, size: 100, color: Colors.grey),
                  ),
          ),
          Divider(color: Colors.grey),
          Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(16),
              children: [
                _buildToolIcon(context, Icons.tune, 'Ajustar'),
                _buildToolIcon(context, Icons.brightness_6, 'Brillo'),
                _buildToolIcon(context, Icons.contrast, 'Contraste'),
                _buildToolIcon(context, Icons.filter, 'Filtros', isFilter: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolIcon(BuildContext context, IconData icon, String label,
      {bool isFilter = false}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32, color: Colors.black),
          onPressed: () {
            if (isFilter) {
              _showFilterSelection(context);
            } else {
              // Implementa acciones para los otros botones
            }
          },
        ),
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }

  void _showFilterSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Filtros',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Implementar aplicación de filtro
                        Navigator.pop(context); // Cerrar el selector
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey[300],
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                            Text(
                              'Filtro ${index + 1}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
