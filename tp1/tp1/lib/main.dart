import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            'Hola, soy Natu!',
            style: TextStyle(fontSize: 30, height: 10),
            ),

          Text(
            'Natan Rosenhain',
            style: TextStyle(height: 10, fontSize: 20,color: Color.fromARGB(255, 255, 145, 0)),
          )
          ]
        ),)
        
      ),
    );
  }
}