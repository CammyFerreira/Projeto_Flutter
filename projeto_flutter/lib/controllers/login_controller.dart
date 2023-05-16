import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> login(context) async {
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
        const Duration(seconds: 6),
      );
      if (resposta.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('USUARIO_ID', json.decode(resposta.body)['USUARIO_ID']);
        Navigator.of(context).pushReplacementNamed('/');
        return true;
      } else {
        try {
          Fluttertoast.showToast(
            msg: 'Email ou senha inválidos!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } catch (e) {
          print('Erro ao exibir a SnackBar: $e');
        }
        return false;
      }
    } on TimeoutException catch (e) {
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
    } catch (e,s) {
      print('Erro no login: $e $s');
      return false;
    } finally {
      client.close();
      isLoading.value = false;
    }
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('USUARIO_ID');
    return userId;
  }
}
