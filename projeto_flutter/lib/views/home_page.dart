import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('data'),
            const Text('data'),
            const Text('data'),
            const Text('data'),
            const Text('data'),
            const Text('data'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/list');
              },
              child: const Text('Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}
