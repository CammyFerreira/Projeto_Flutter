import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/busca.dart';
import 'package:projeto_flutter/views/carrinho.dart';
import 'package:projeto_flutter/views/categorias_view.dart';
import 'package:projeto_flutter/views/home_page.dart';
import 'package:projeto_flutter/views/login.dart';
import 'package:projeto_flutter/views/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const HomeView(),
    const Busca(),
    const CategoryView(),
    const CarrinhoView(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(
          () => currentIndex = index,
        ),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            backgroundColor: Colors.red,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Buscar',
            backgroundColor: Colors.red,
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Categorias',
            backgroundColor: Colors.red,
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Carrinho',
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.account_box,
            ),
          ),
        ],
      ),
    );
  }
}
