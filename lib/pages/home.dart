import 'package:examen/pages/Historias.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> historias = [
    {'usuario': 'Tu Historia', 'imagen': 'https://via.placeholder.com/150'},
    {'usuario': 'Usuario 1', 'imagen': 'https://via.placeholder.com/200'},
    {'usuario': 'Usuario 2', 'imagen': 'https://via.placeholder.com/250'},
    {'usuario': 'Usuario 3', 'imagen': 'https://via.placeholder.com/300'},
    {'usuario': 'Usuario 4', 'imagen': 'https://via.placeholder.com/350'},
  ];

  final List<bool> likes = List.generate(5, (index) => false);

  final Map<int, List<String>> comentariosPorPublicacion = {
    0: ['Buen post!', 'Me gusta mucho.'],
    1: [],
    2: [],
    3: [],
    4: [],
  };

  void showComments(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Comentarios',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002D40),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: comentariosPorPublicacion[index]?.length ?? 0,
                  itemBuilder: (context, commentIndex) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.person, color: Colors.grey[800]),
                      ),
                      title: Text(
                        'Usuario ${commentIndex + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(comentariosPorPublicacion[index]![commentIndex]),
                    );
                  },
                ),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Escribe un comentario...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Color(0xFF1AA6B7)),
                    onPressed: () {
                      setState(() {
                        comentariosPorPublicacion[index]?.add('Nuevo comentario');
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1AA6B7), // Teal
        elevation: 0,
        title: Text(
          'FilterApp',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notificaciones');
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Historias
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: historias.length,
              itemBuilder: (context, index) {
                bool isUserStory = index == 0; // "Tu Historia"
                return GestureDetector(
                  onTap: () {
                    if (isUserStory) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoriasPage(
                            historias: [
                              'https://via.placeholder.com/150',
                              'https://via.placeholder.com/200',
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isUserStory
                                ? Colors.pink
                                : Colors.transparent,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(historias[index]['imagen']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        historias[index]['usuario']!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: likes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFFD9ECF2), // Light Blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen de la publicación
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12)),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/sample${index + 1}.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Título y descripción
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Publicación ${index + 1}',
                              style: TextStyle(
                                color: Color(0xFF002D40), // Dark Blue
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Esta es la descripción de la publicación ${index + 1}.',
                              style: TextStyle(
                                color: Color(0xFF1AA6B7), // Teal
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Botones de acción
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              likes[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: likes[index]
                                  ? Colors.red
                                  : Color(0xFF002D40),
                            ),
                            onPressed: () {
                              setState(() {
                                likes[index] = !likes[index];
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.comment,
                                color: Color(0xFF1AA6B7)), // Teal
                            onPressed: () {
                              showComments(context, index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.share,
                                color: Color(0xFF002D40)), // Dark Blue
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF56A79), // Soft Red
        onPressed: () {
          Navigator.pushNamed(context, '/publicar');
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
