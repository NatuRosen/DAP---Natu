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

                if (userInput.isEmpty || passInput.isEmpty) {
                  print('Vacío');
                  return;
                }
                if ((userInput == 'Natu') && (passInput == '12345')) {
                  print('Login exitoso');
                  context.push('/homeScreen', extra: userInput);
                } else {
                  print('Login Fallido');
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
