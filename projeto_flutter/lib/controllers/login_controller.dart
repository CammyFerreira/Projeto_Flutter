import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> login() async {
    var client = http.Client();
    try {
      isLoading.value = true;
      final url = Uri.parse('https://minhasapis.com.br/login/');
      final resposta = await client.post(
        url,
        body: {
          'email': _login,
          'senha': _pass,
        },
      );
      if (resposta.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } finally {
      client.close();
      isLoading.value = true;
    }
  }
}
