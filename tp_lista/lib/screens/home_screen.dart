import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String user;
  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<String> users = ['Natu', 'Pedro', 'Pablo', 'Juan'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pantalla lista'),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(users[index]),
                subtitle: Text('Usuario ${index + 1}'),
              ));
            }));
  }
}