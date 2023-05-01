import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/models/product.dart';

class ProductController {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<List<Product>> callAPI() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('http://10.0.2.2:8000/api/produtos'),
      );
      var decodedResponse = jsonDecode(response.body);
      List<Product> products = List<Product>.from(
        decodedResponse['produtos'].map((product) => Product.fromJson(product)),
      );
      _products = products;
      return products;
    } finally {
      client.close();
    }
  }
}
