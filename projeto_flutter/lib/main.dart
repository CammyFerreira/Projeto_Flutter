import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/carrinho.dart';
import 'package:projeto_flutter/views/bottom_navigation.dart';
import 'package:projeto_flutter/views/list_categories.dart';
import 'package:projeto_flutter/views/itens_pedidos.dart';
import 'package:projeto_flutter/views/list_page.dart';
import 'package:projeto_flutter/views/pedido_finalizado.dart';
import 'package:projeto_flutter/views/splash.dart';
import 'package:projeto_flutter/views/login.dart';
import 'package:projeto_flutter/views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const int primaryValue = 0xff0bcbb0;
    const MaterialColor primaryColor = MaterialColor(
      primaryValue,
      <int, Color>{
        50: Color(0xff0bcbb0),
        100: Color(0xff0bcbb0),
        200: Color(0xff0bcbb0),
        300: Color(0xff0bcbb0),
        400: Color(0xff0bcbb0),
        500: Color(primaryValue),
        600: Color(0xff0bcbb0),
        700: Color(0xff0bcbb0),
        800: Color(0xff0bcbb0),
        900: Color(0xff0bcbb0),
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/splash': (_) => const SplashView(),
        '/login': (_) => LoginView(),
        '/list': (_) => const ListPage(),
        '/carrinho': (_) => const CarrinhoView(),
        '/finalizado': (_) => const PedidoFinalizado(),
        '/categorias': (_) => const ListCategories(),
        '/profile': (_) =>  const UserProfileScreen(),
        '/itens-pedido': (_) => const ItensPedido(),
      },
    );
  }
}
