import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/controllers/login_controller.dart';
import 'package:projeto_flutter/models/pedido.dart';

final LoginController _controller = LoginController();

// class PedidoController {
//   List<Pedido> _pedidos = [];

//   List<Pedido> get pedidos => _pedidos;

//   Future<List<Pedido>> callAPI({int? userId}) async {
//     var client = http.Client();

//   userId ??= await _controller.getUserId(); 

//     try {
//       var response = await client.get(
//         Uri.parse('http://10.0.2.2:8000/api/pedidos/94'),
//       );
//       var decodedResponse = jsonDecode(response.body);
//       List<Pedido> pedidos = List<Pedido>.from(
//         decodedResponse['pedidos'].map((pedido) => Pedido.fromJson(pedido)),
//       );
//       _pedidos = pedidos;
//       return pedidos;
//     } finally {
//       client.close();
//     }
//   }
// }

class PedidoController {
  List<Pedido> pedidos = [];

  Future<List<Pedido>> fetchPedidos({int? userId}) async {

    userId ??= await _controller.getUserId(); 
    // Aqui você faria a chamada à API para obter os dados
    // Substitua a chamada fictícia por sua implementação real
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/pedidos/94'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      pedidos = jsonData.map<Pedido>((json) => Pedido.fromJson(json)).toList();
      
      return pedidos;
    } else {
      throw Exception('Erro ao carregar os pedidos');
    }
  }
}


