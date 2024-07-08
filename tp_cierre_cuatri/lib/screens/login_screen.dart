import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_cierre_cuatri/entities/users.dart';
import 'package:tp_cierre_cuatri/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController userController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                String userInput = userController.text;
                String passInput = passController.text;

                List<Usuarios> users = [
                  Usuarios('natu', '1234'),
                  Usuarios('juan', '4321'),
                  Usuarios('pepe', 'hola'),
                  Usuarios('pipu', 'chau'),
                ];
                var snackBarVacio = SnackBar(
                   content: const Text("Usuario incorrecto"),
                   action: SnackBarAction(
                  label: 'Descartar',
                  onPressed: () {},
                  ));

                var snackBarIncorrecto = SnackBar(
                   content: const Text("Usuario incorrecto"),
                   action: SnackBarAction(
                  label: 'Descartar',
                  onPressed: () {},
                  ));

                if (userInput.isEmpty || passInput.isEmpty) {
                  print('Vacío');
                  
                  ScaffoldMessenger.of(context).showSnackBar(snackBarVacio);
                  return;
                }

                int x = users.indexWhere((Usuarios) => Usuarios.user == userController.text);
                if (x != -1) {
                  if(users[x].pass == passController.text){
                  print('Login exitoso');
                  context.pushNamed(HomeScreen.name);
                }
                } else {
                  print('Login Fallido');
                  ScaffoldMessenger.of(context).showSnackBar(snackBarIncorrecto);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}