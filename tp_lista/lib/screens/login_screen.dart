import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

                List<String> users = ['Natu', 'Pedro', 'Pablo', 'Juan'];
                List<String> passwords = ['1234', '4321', '2134', '1243'];

                if (userInput.isEmpty || passInput.isEmpty) {
                  print('Vacío');
                  SnackBar snackBarVacio = SnackBar(
                      content: const Text('Usuario o contraseña vacío'));
                  //ScaffoldMessenger.of(context).showSnackBar(snackBarVacio);
                  return;
                }
                if ((users.contains(userInput))) {
                  if (passwords.contains(passInput) &&
                      passInput == passwords[users.indexOf(userInput)]) {
                    print('Login exitoso');
                    context.push('/homeScreen', extra: userInput);
                  }
                } else {
                  print('Login Fallido');
                  SnackBar snackBarIncorrecto =
                      SnackBar(content: const Text('Login correcto'));
                  //ScaffoldMessenger.of(context).showSnackBar(snackBarIncorrecto);
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
