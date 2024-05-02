import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String user;
  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla principal'),
      ),
      body: Center(
          child: Text(
        'Bienvenido $user',
        style: const TextStyle(
            fontSize: 50, color: Color.fromARGB(255, 255, 0, 0)),
      )),
    );
  }
}
