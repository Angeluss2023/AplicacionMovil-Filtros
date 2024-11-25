import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String username;
  final String name;
  final int publicaciones;
  final int seguidores;
  final int seguidos;
  final List<String> posts; // Lista de imágenes de publicaciones

  PerfilPage({
    required this.username,
    required this.name,
    required this.publicaciones,
    required this.seguidores,
    required this.seguidos,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implementar notificaciones si se requiere
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Implementar opciones si se requiere
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Imagen del perfil
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(width: 20),
                // Estadísticas
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildProfileStat('$publicaciones', 'Publicaciones'),
                      _buildProfileStat('$seguidores', 'Seguidores'),
                      _buildProfileStat('$seguidos', 'Seguidos'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Nombre del usuario
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _buildActionButton('Editar'),
                    SizedBox(width: 10),
                    _buildActionButton('Compartir perfil'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Botones de navegación entre publicaciones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.grid_on),
                onPressed: () {
                  // Implementar funcionalidad
                },
              ),
              IconButton(
                icon: Icon(Icons.video_collection_outlined),
                onPressed: () {
                  // Implementar funcionalidad
                },
              ),
              IconButton(
                icon: Icon(Icons.person_pin),
                onPressed: () {
                  // Implementar funcionalidad
                },
              ),
            ],
          ),
          Divider(color: Colors.grey),
          // Grid de publicaciones
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: posts[index].isNotEmpty
                      ? Image.network(
                          posts[index],
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Icon(Icons.image, color: Colors.grey),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
