import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/controllers/login_controller.dart';
import 'package:projeto_flutter/models/pedido.dart';

final LoginController _controller = LoginController();

class PedidoController {
  List<Pedido> pedidos = [];

  Future<List<Pedido>> fetchPedidos({int? userId}) async {
    userId ??= await _controller.getUserId();
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/pedidos/$userId'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      pedidos = jsonData.map<Pedido>((json) => Pedido.fromJson(json)).toList();

      return pedidos;
    } else if (response.statusCode == 404) {
      return pedidos;
    } else {
      throw Exception('Erro ao carregar os pedidos');
    }
  }
}


