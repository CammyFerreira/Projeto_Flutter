import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/home.dart';
import 'package:projeto_flutter/views/splash.dart';
import 'package:projeto_flutter/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/splash': (_) => const SplashView(),
        '/login': (_) => const LoginView(),
      },
    );
  }
}