import 'package:flutter/material.dart';
import 'pages/inicioSesion.dart';
import 'pages/registro.dart';
import 'pages/home.dart';
import 'pages/filtros.dart';
import 'pages/perfil.dart';
import 'pages/buscar.dart';
import 'pages/publicar.dart';
import 'pages/notificaciones.dart';
import 'pages/Historias.dart';

void main() {
  runApp(MyApp());
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
        '/perfil': (context) => PerfilPage(),
        '/buscar': (context) => BuscarPage(),
        '/publicar': (context) => PublicarPage(),
        '/historias': (context) => HistoriasPage(),
        '/notificaciones': (context) => NotificacionesPage(),
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

  final List<Widget> _pages = [
    HomePage(),
    BuscarPage(),
    PublicarPage(),
    NotificacionesPage(),
    PerfilPage(),
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
