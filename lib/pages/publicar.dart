import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'edicion.dart'; // Importa la clase EdicionPage desde edicion.dart

class PublicarPage extends StatefulWidget {
  @override
  _PublicarPageState createState() => _PublicarPageState();
}

class _PublicarPageState extends State<PublicarPage>
    with SingleTickerProviderStateMixin {
  File? _selectedImage;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _pickFirstImageFromGallery();

    // Configuración de la animación
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Iniciar la animación al cargar la vista
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickFirstImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nueva publicación'),
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          actions: [
            TextButton(
                onPressed: () {
                  // Navegación dinámica para pasar la imagen seleccionada.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EdicionPage(
                        imagePath: _selectedImage?.path ?? '', // Pasar la ruta de la imagen
                      ),
                    ),
                  );
                },
                child: Text(
                  'Siguiente',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),

          ],
        ),
        body: Column(
          children: [
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        'Cargando imagen...',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.camera_alt, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Recientes...',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        'Imagen ${index + 1}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
