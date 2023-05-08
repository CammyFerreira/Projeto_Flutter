import 'dart:async';
import 'dart:convert';
import 'package:projeto_flutter/models/category.dart';
import 'package:http/http.dart' as http;

class CategoriasController {
  List<Categoria> _categorias = [];

  List<Categoria> get categorias => _categorias;

  Future<List<Categoria>> callAPI() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('http://10.0.2.2:8000/api/categorias'),
      );
      var decodedResponse = jsonDecode(response.body);
      List<Categoria> categorias = List<Categoria>.from(
        decodedResponse['categorias'].map((categorias) => Categoria.fromJson(categorias)),
      );
      _categorias = categorias;
      return categorias;
    } finally {
      client.close();
    }
  }
}
