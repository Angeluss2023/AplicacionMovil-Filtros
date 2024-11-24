import 'package:flutter/material.dart';

class InicioSesionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9ECF2), // Fondo pastel azul claro
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo de la app con una pequeña animación de entrada
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, -50 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      'FilterApp',
                      style: TextStyle(
                        color: Color(0xFF002D40), // Azul oscuro para contraste
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  // Campo de correo electrónico
                  TextField(
                    style: TextStyle(color: Color(0xFF002D40)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFFFFF), // Blanco para campos de entrada
                      hintText: 'Correo Electrónico',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Campo de contraseña
                  TextField(
                    style: TextStyle(color: Color(0xFF002D40)),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFFFFF), // Blanco para campos de entrada
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Botón de Iniciar Sesión con animación
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF56A79), // Color coral para el botón
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Texto para registrarse con efecto hover
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        '¿No tienes cuenta? Regístrate',
                        style: TextStyle(
                          color: Color(0xFF1AA6B7), // Azul para el texto
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Pie de página (opcional, puede ser tu marca o texto adicional)
                  Text(
                    '© 2024 FilterApp Inc.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
