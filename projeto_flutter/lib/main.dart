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
      initialRoute: '/login',
      routes: {
        '/': (_) => const HomePage(),
        '/splash': (_) => const SplashView(),
        '/login': (_) => LoginView(),
      },
    );
  }
}
