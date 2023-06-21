import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:projeto_flutter/controllers/cadastro_controller.dart';

class CadastroView extends StatelessWidget {
  final CadastroController _controller = CadastroController();
  CadastroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
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
                    onChanged: _controller.setNome,
                    maxLength: 100,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      if (value.length < 3) {
                        return "O nome deve conter no mínimo 3 caracteres";
                      }
                    },
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                    ),
                  ),
                  TextFormField(
                    onChanged: _controller.setCpf,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      if (value.length < 11) {
                        return "O cpf deve ter pelo menos 11 caracteres";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('CPF'),
                    ),
                  ),
                  TextFormField(
                    onChanged: _controller.setEmail,
                    maxLength: 100,
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
                    maxLength: 100,
                    onChanged: _controller.setPass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      if (value.length < 8) {
                        return "A senha deve conter pelo menos 8 caracteres";
                      }
                    },
                    decoration: const InputDecoration(
                      label: Text('Senha'),
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
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await _controller.cadastrar().then(
                                    (result) {
                                      if (result) {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/login');
                                      } else {
                                        isLoading = false;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Campos inválidos'),
                                            duration: Duration(seconds: 5),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text('Cadastrar'),
                            ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
