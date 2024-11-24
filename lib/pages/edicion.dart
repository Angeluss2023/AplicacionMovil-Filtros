import 'package:flutter/material.dart';

class EdicionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar publicación'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Aquí podrás editar la publicación.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
