import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:projeto_flutter/controllers/cadastro_controller.dart';

import '../controllers/cadastro_controller.dart';

class CadastroView extends StatelessWidget {
  final CadastroController _controller = CadastroController();
  CadastroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/icon.png',
                height: 90,
                width: 90,
              ),
              const Text('Cadastre-se'),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  // obrigatório
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: const InputDecoration(
                  label: Text('CPF'),
                ),
              ),
              TextFormField(
                onChanged: _controller.setCadastro,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Endereço'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: _controller.isLoading,
                  builder: (_, isLoading, __) => isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 11, 203, 176),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _controller.cadastrar().then((result) {
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
                          child: const Text('Cadastrar'),
                        ),
                ),
              ),
            ],
          )),
    ));
  }
}
