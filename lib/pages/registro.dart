import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logotipo o título
                  Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                    ),
                  ),
                  SizedBox(height: 20),
                  // Imagen decorativa
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.person_add_alt_1,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Campo de Nombre
                  _buildTextField(
                    hintText: 'Nombre Completo',
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  // Campo de correo electrónico
                  _buildTextField(
                    hintText: 'Correo Electrónico',
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  // Campo de contraseña con visibilidad
                  _buildPasswordField(
                    hintText: 'Contraseña',
                    isPasswordVisible: _isPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  // Campo de confirmar contraseña con visibilidad
                  _buildPasswordField(
                    hintText: 'Confirmar Contraseña',
                    isPasswordVisible: _isConfirmPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  // Botón de registro
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Regresa al inicio de sesión
                    },
                    child: Text(
                      'Completar Registro',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Texto para regresar a inicio de sesión
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '¿Ya tienes cuenta? Inicia Sesión',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Footer con derechos reservados
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

  // Método para construir los campos de texto reutilizables
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Método para construir los campos de contraseña con visibilidad
  Widget _buildPasswordField({
    required String hintText,
    required bool isPasswordVisible,
    required VoidCallback onVisibilityChanged,
  }) {
    return TextField(
      obscureText: !isPasswordVisible,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[400],
          ),
          onPressed: onVisibilityChanged,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
