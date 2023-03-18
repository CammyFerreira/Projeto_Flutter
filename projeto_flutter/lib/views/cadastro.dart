import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CadastroView extends StatelessWidget {
  const CadastroView({super.key});

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
              height: 98,
              width: 98,
            ),
            const Text('Cadastre-se'),
            const TextField(
              decoration: InputDecoration(
                label: Text('Nome'),
              ),
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('CPF'),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Email'),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Senha'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
              ),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).pushReplacementNamed('/login'),
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
