import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Temperatura',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const convertTemp(),
    );
  }
}

class convertTemp extends StatefulWidget {
  const convertTemp({super.key});

  @override
  State<convertTemp> createState() => _convertTempState();
}

class _convertTempState extends State<convertTemp> {
  final TextEditingController _tempController = TextEditingController();
  String _result = '';

  void converter() {
    double? temp = double.tryParse(_tempController.text);
    double? tempF = (temp! * 9 / 5) + 32;
    setState(() {
      _result = 'Temperatura em Fahrenheit: ${tempF.toStringAsFixed(2)} °F';
    });
  }

  void _clearFields() {
    _tempController.clear();
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversor de Temperatura')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a temperatura em Celsius',
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: converter,
                  child: const Text('Converter'),
                ),
                ElevatedButton(
                  onPressed: _clearFields,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
