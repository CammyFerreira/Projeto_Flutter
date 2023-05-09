import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _volume = 50.0;

  void _incrementVolume() {
    setState(() {
      _volume += 5.0;
    });
  }

  void _decrementVolume() {
    setState(() {
      _volume -= 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rádio SENAC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _volume,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _incrementVolume,
                  tooltip: 'Increment Volume',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: _decrementVolume,
                  tooltip: 'Decrement Volume',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
