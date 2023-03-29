import 'package:flutter/material.dart';
import 'package:validadores/validadores.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  'images/icon.png',
                  width: 98,
                  height: 98,
                ),
              ),
              const Text(
                'Login',
                textAlign: TextAlign.start,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*campo obrigatório";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*campo obrigatório";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: GestureDetector(
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 11, 203, 176),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('Valido');
                    }
                  },
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  //TODO: Ir para a tela de cadastro
                },
                child: const Text(
                  'Cadastre-se',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
