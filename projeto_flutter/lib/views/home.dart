import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/categorias_view.dart';
import 'package:projeto_flutter/views/home_page.dart';
import 'package:projeto_flutter/views/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const HomeView(),
    Text('buscar'),
    CategoryView(),
    Text('carrinho'),
    LoginView(),
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
