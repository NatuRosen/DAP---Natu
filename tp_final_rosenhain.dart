import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/User_Provider.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();

var logged = false;

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var usuarios = ref.watch(usersProvider);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Inicio de sesión",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: userController,
          decoration: const InputDecoration(
              hintText: 'Usuario', icon: Icon(Icons.person)),
        ),
        TextField(
          controller: passController,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Contraseña', icon: Icon(Icons.key)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              for (var usuario in usuarios) {
                if (usuario.user == userController.text &&
                    usuario.pass == passController.text) {
                  context.go('/home');
                  logged = true;
                  break;
                } else if (userController.text == '' &&
                    passController.text == '' &&
                    usuarios.last == usuario) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Usuario y Contraseña Vacios"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (userController.text == '' &&
                    usuarios.last == usuario) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Usuario Vacio"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (passController.text == '' &&
                    usuarios.last == usuario) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Contraseña Vacia"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (logged == false && usuarios.last == usuario) {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Usuario o Contraseña Incorrecto"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
              logged = false;
            },
            child: const Text("Login")),
      ],
    )));
  }
}