import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginView({Key? key}) : super(key: key);

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
                onChanged: _controller.setLogin,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                  if (!EmailValidator.validate(value, true)) {
                    return 'Email inválido';
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              TextFormField(
                obscureText: true,
                onChanged: _controller.setPass,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ValueListenableBuilder<bool>(
                  valueListenable: _controller.isLoading,
                  builder: (_, isLoading, __) => isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 118, 50, 213),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _controller.auth().then((result) {
                                if (result) {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Email ou senha inválidos'),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text('Login'),
                        ),
                ),
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 118, 50, 213),
                ),
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
