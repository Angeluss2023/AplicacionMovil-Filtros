import 'package:flutter/material.dart';
import 'pages/inicioSesion.dart';
import 'pages/registro.dart';
import 'pages/home.dart';
import 'pages/filtros.dart';
import 'pages/perfil.dart';
import 'pages/buscar.dart';
import 'pages/publicar.dart';
import 'pages/notificaciones.dart';
import 'pages/edicion.dart';
import 'pages/Historias.dart';

void main() {
  runApp(MyApp());
}

// Función para obtener las notificaciones
Future<List<Map<String, dynamic>>> fetchNotificaciones() async {
  await Future.delayed(Duration(seconds: 2)); // Simula un tiempo de espera
  return [
    {
      'tipo': 'solicitud',
      'usuario': 'andres.nvpr1v',
      'detalle': '+ 41 más',
      'icono': Icons.person_add,
      'nuevo': true,
    },
    {
      'tipo': 'like',
      'usuario': 'abriguerra',
      'detalle': 'publicó un hilo que quizá te guste: Momento JINX 💙',
      'imagen': 'https://via.placeholder.com/50',
      'nuevo': true,
    },
    {
      'tipo': 'like',
      'usuario': 'mateo_canizares_',
      'detalle': 'te invitaron a unirte a sus canales de difusión.',
      'imagen': 'https://via.placeholder.com/50',
      'nuevo': true,
    },
    {
      'tipo': 'follow',
      'usuario': '_dg_bm',
      'detalle': 'a quien quizá conozcas, está en Instagram.',
      'nuevo': false,
    },
  ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilterApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioSesionPage(),
        '/registro': (context) => RegistroPage(),
        '/home': (context) => MainScreen(),
        '/filtros': (context) => FiltrosPage(),
        '/perfil': (context) => PerfilPage(
              username: 'bryamfer_guachun',
              name: 'Bryam Guachun',
              publicaciones: 2,
              seguidores: 156,
              seguidos: 798,
              posts: [
                'https://ejemplo.com/imagen1.png',
                'https://ejemplo.com/imagen2.png',
                '', // Publicación sin imagen
              ],
            ),
        '/buscar': (context) => BuscarPage(),
        '/publicar': (context) => PublicarPage(),
        '/historias': (context) => HistoriasPage(
          historias: [
            'https://via.placeholder.com/150', // URL de ejemplo de imagen
            'https://via.placeholder.com/200', // Otra URL de ejemplo
          ],
      ),
  '/notificaciones': (context) => NotificacionesPage(notificacionesFuture: fetchNotificaciones()),
        '/notificaciones': (context) =>
            NotificacionesPage(notificacionesFuture: fetchNotificaciones()),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Asegúrate de pasar notificacionesFuture aquí también
  final List<Widget> _pages = [
    HomePage(),
    BuscarPage(),
    PublicarPage(),
    NotificacionesPage(notificacionesFuture: fetchNotificaciones()),
    PerfilPage(
      username: 'bryamfer_guachun',
      name: 'Bryam Guachun',
      publicaciones: 2,
      seguidores: 156,
      seguidos: 798,
      posts: [
        'https://ejemplo.com/imagen1.png',
        'https://ejemplo.com/imagen2.png',
        'https://ejemplo.com/imagen3.png',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Publicar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
