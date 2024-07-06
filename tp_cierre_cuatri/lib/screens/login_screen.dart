import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_cierre_cuatri/entities/users.dart';

class LoginScreen extends StatelessWidget {
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

                if (userInput.isEmpty || passInput.isEmpty) {
                  print('Vacío');
                  /*SnackBar snackBarVacio = const SnackBar(
                    content: Text('Usuario o contraseña vacío'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarVacio);*/
                  return;
                }

                Usuarios? foundUser = users.firstWhere(
                  (usuario) => usuario.user == userInput && usuario.pass == passInput,
                  orElse: () => Usuarios('0', '0') // Devolver una instancia vacía de Usuarios
                );

                if (foundUser != Usuarios('0', '0')) {
                  print('Login exitoso');
                  context.go('/homeScreen', extra: userInput);
                } else {
                  print('Login Fallido');
                  /*SnackBar snackBarIncorrecto = SnackBar(
                    content: const Text('Usuario o contraseña incorrectos'),
                  );
                  //ScaffoldMessenger.of(context).showSnackBar(snackBarIncorrecto);*/
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