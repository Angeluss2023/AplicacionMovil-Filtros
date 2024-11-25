import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HistoriasPage extends StatefulWidget {
  final List<String> historias; // Historias del usuario autenticado

  HistoriasPage({required this.historias});

  @override
  _HistoriasPageState createState() => _HistoriasPageState();
}

class _HistoriasPageState extends State<HistoriasPage> {
  final ImagePicker _picker = ImagePicker(); // Para seleccionar imágenes

  Future<void> _agregarHistoria() async {
    // Permite al usuario seleccionar entre cámara o galería
    final XFile? imagenSeleccionada = await _picker.pickImage(
      source: ImageSource.gallery, // Cambiar a ImageSource.camera si es necesario
    );

    if (imagenSeleccionada != null) {
      setState(() {
        widget.historias.add(imagenSeleccionada.path);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Historia agregada con éxito')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1AA6B7),
        title: const Text(
          'Historias',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
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
              onPressed: _agregarHistoria, // Función para agregar una historia
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label: const Text(
                "Abrir cámara o galería",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF56A79),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          const SizedBox(height: 8),
          const Text(
            "Tus historias",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF002D40),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: widget.historias.isEmpty
                ? Center(
                    child: const Text(
                      "Aún no has agregado historias.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.historias.length,
                    itemBuilder: (context, index) {
                      final historia = widget.historias[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: historia.startsWith('http')
                              ? NetworkImage(historia) // Para URL remota
                              : FileImage(File(historia)) as ImageProvider, // Para path local
                          radius: 30,
                        ),
                        title: const Text(
                          "Historia publicada",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF002D40),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          // Acción para ver la historia seleccionada
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
