import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_flutter/models/category.dart';
import 'package:http/http.dart' as http;

ValueNotifier<List<Categoria>> categorias = ValueNotifier<List<Categoria>>([]);
  
class CategoriasController {
  getCategoriesList(context) async {
    var client = http.Client();
    try {
      final url = Uri.parse('http://10.0.2.2:8000/api/login');
      final resposta = await client
          .get(
            url,
          )
          .timeout(
            const Duration(seconds: 6),
          );
      if (resposta.statusCode == 200) {
        var decodedResponse = jsonDecode(resposta.body) as List;
        categorias.value = decodedResponse.map((e) => Categoria.fromJson(e)).toList();
        return categorias;
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
    } catch (e) {
      print('Erro no login: $e');
      return false;
    } finally {
      client.close();
    }
  }
}
