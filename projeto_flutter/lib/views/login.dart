import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/icon.png',
            width: 98,
            height: 98,
          ),
          const TextField(
            decoration: InputDecoration(
              label: Text('Login'),
            ),
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              label: Text('Senha'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: null,
              child: Text('Entrar'),
            ),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Cadastre-se'),
          ),
        ],
      ),
    ));
  }
}
