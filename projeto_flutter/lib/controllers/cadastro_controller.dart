import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroController {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String? _email;
  setEmail(String value) => _email = value;

  String? _pass;
  setPass(String value) => _pass = value;

  String? _nome;
  setNome(String value) => _nome = value;

  String? _cpf;
  setCpf(String value) => _cpf = value;

  late String? cpfSemFormatacao;

  String? formatarCpf() {
    if (_cpf != null) {
      cpfSemFormatacao = _cpf!.replaceAll(RegExp(r'[^\d]'), '');
      return cpfSemFormatacao;
    }
    return null;
  }

  Future<bool> cadastrar() async {
    var client = http.Client();
    try {
      isLoading.value = true;
      final url = Uri.parse('http://10.0.2.2:8000/api/cadastro');
      final resposta = await client.post(
        url,
        body: {
          'USUARIO_NOME': _nome,
          'USUARIO_EMAIL': _email,
          'USUARIO_SENHA': _pass,
          'USUARIO_CPF': formatarCpf(),
        },
      );
      if (resposta.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
