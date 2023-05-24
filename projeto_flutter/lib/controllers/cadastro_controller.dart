import 'package:flutter/material.dart';

class CadastroController {

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String? _cadastro;
  setCadastro(String value) => _cadastro = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> cadastrar() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    return _cadastro == 'adm@adm' && _pass == '123';
  }
}