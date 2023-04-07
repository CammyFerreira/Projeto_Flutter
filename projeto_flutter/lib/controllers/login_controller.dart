import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      final url = Uri.parse('http://10.0.2.2:8000/api/login');
      final resposta = await client.post(
        url,
        body: {
          'email': _login,
          'senha': _pass,
        },
      ).timeout(
        const Duration(seconds: 10),
      );
      if (resposta.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on TimeoutException {
      Fluttertoast.showToast(
        msg: 'A conexão expirou. Por favor, tente novamente mais tarde.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    } finally {
      client.close();
      isLoading.value = false;
    }
  }
}
