import 'package:http/http.dart' as http;
import 'package:projeto_flutter/controllers/login_controller.dart';

final LoginController _controller = LoginController();

class OrderController {

  static const String baseUrl = "http://10.0.2.2:8000/api/fechar-pedido";
  Future<bool> fecharPedido({int? userId}) async {
    userId ??= await _controller.getUserId();
    final response = await http.post(
      Uri.parse('$baseUrl/$userId'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Falha ao fechar o pedido");
    }
  }
}
