import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Média',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const calcmedia(),
    );
  }
}

class calcmedia extends StatefulWidget {
  const calcmedia({super.key});

  @override
  State<calcmedia> createState() => _calcmediaState();
}

class _calcmediaState extends State<calcmedia> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  double media = 0.0;
  String situacao = '';

  void calcularMedia() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0.0;
    setState(() {
      media = (nota1 + nota2 + nota3) / 3;
      _situacao();
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  void _situacao() {
    if (media >= 6) {
      situacao = 'Aprovado';
    } else {
      situacao = 'Reprovado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Média')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 1'),
            ),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 2'),
            ),
            TextField(
              controller: nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularMedia,
              child: const Text('Calcular Média'),
            ),
            const SizedBox(height: 20),
            Text('Média: ${media.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            Text('Situação: $situacao'),
          ],
        ),
      ),
    );
  }
}
