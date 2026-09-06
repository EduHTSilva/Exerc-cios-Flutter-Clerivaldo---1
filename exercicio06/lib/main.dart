import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const calculadora(),
    );
  }
}

class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  TextEditingController valor1Controller = TextEditingController();
  TextEditingController valor2Controller = TextEditingController();
  String _resultado = '0';

  void _somar() {
    double valor1 = double.tryParse(valor1Controller.text) ?? 0;
    double valor2 = double.tryParse(valor2Controller.text) ?? 0;
    setState(() {
      _resultado = '${valor1 + valor2}';
    });
  }

  void _subtrair() {
    double valor1 = double.tryParse(valor1Controller.text) ?? 0;
    double valor2 = double.tryParse(valor2Controller.text) ?? 0;
    setState(() {
      _resultado = '${valor1 - valor2}';
    });
  }

  void _multiplicar() {
    double valor1 = double.tryParse(valor1Controller.text) ?? 0;
    double valor2 = double.tryParse(valor2Controller.text) ?? 0;
    setState(() {
      _resultado = '${valor1 * valor2}';
    });
  }

  void _dividir() {
    double valor1 = double.tryParse(valor1Controller.text) ?? 0;
    double valor2 = double.tryParse(valor2Controller.text) ?? 0;
    setState(() {
      if (valor2 != 0) {
        _resultado = '${valor1 / valor2}';
      } else {
        _resultado = 'Erro! Divisão por zero!';
      }
    });
  }

  void _limpar() {
    valor1Controller.clear();
    valor2Controller.clear();
    setState(() {
      _resultado = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: valor1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor 1'),
            ),
            TextField(
              controller: valor2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor 2'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _somar, child: const Text('Somar')),
                ElevatedButton(
                  onPressed: _subtrair,
                  child: const Text('Subtrair'),
                ),
                ElevatedButton(
                  onPressed: _multiplicar,
                  child: const Text('Multiplicar'),
                ),
                ElevatedButton(
                  onPressed: _dividir,
                  child: const Text('Dividir'),
                ),
              ],
            ),
            ElevatedButton(onPressed: _limpar, child: const Text('Limpar')),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
