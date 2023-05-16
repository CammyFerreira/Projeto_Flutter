import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/controllers/login_controller.dart';
import 'package:projeto_flutter/models/cart.dart';
import 'package:projeto_flutter/models/product.dart';

final LoginController _controller = LoginController();

class CartController {
  static const String baseUrl = "http://10.0.2.2:8000/api/carrinho";

  Future<List<CarrinhoItem>> listarCarrinho({int? userId}) async {
    userId ??= await _controller.getUserId();

    final response = await http.get(Uri.parse('$baseUrl/41'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);

      List<CarrinhoItem> carrinhoItens = [];
      for (var itemJson in json) {
        CarrinhoItem carrinhoItem = CarrinhoItem.fromJson(itemJson);
        // Obter os detalhes do produto usando o ID do produto
        Product produto = await getProductDetails(carrinhoItem.produtoId);
        // Atribuir o objeto do produto ao CarrinhoItem
        carrinhoItem.produto = produto;
        carrinhoItens.add(carrinhoItem);
      }
      return carrinhoItens;
    } else if (response.statusCode == 204) {
      throw Exception();
    } else {
      throw Exception("Falha ao listar carrinho");
    }
  }

  Future<Product> getProductDetails(int? productId) async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2:8000/api/produtos?filtro=id_produto:$productId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final Product product = Product.fromJson(json['produtos'][0]);
      return product;
    } else {
      throw Exception("Falha ao obter detalhes do produto");
    }
  }

  static Future<void> adicionar(int userId, int produtoId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$userId'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, int>{
        'PRODUTO_ID': produtoId,
        'ITEM_QTD': 1,
      }),
    );
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception("Falha ao adicionar item no carrinho");
    }
  }

  static Future<void> atualizar(int userId, int produtoId, int itemQtd) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$userId/$produtoId'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, int>{
        'ITEM_QTD': itemQtd,
      }),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception("Falha ao atualizar item no carrinho");
    }
  }

  static Future<void> deletar(int userId, int produtoId) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$userId/item/$produtoId'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, int>{
        'ITEM_QTD': 0,
      }),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception("Falha ao remover item do carrinho");
    }
  }
}
