import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget{
  static const String name = 'detalles';
  dynamic descripcion;
  DescriptionScreen({super.key, this.descripcion});

  @override
  Widget build (BuildContext){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(width: 500, height: 500, child: Image.network(descripcion.bandera)),
          Text(descripcion.descripcion,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
          ],
        ),
      ),
    );
  }
}