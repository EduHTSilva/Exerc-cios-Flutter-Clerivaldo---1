import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de combustivel',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const calcconsumo(),
    );
  }
}

class calcconsumo extends StatefulWidget {
  const calcconsumo({super.key});

  @override
  State<calcconsumo> createState() => _calcconsumoState();
}

class _calcconsumoState extends State<calcconsumo> {
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _combustivelController = TextEditingController();
  String _classificacao = '';
  double _consumo = 0;

  void _calcularConsumo() {
    final double distancia = double.tryParse(_distanciaController.text) ?? 0;
    final double combustivel =
        double.tryParse(_combustivelController.text) ?? 0;

    setState(() {
      _consumo = distancia / combustivel;
      if (_consumo >= 12) {
        _classificacao = 'Econômico';
      } else {
        _classificacao = 'Consumo elevado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de Combustível')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _distanciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Distância percorrida (km)',
              ),
            ),
            TextField(
              controller: _combustivelController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Combustível consumido (litros)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularConsumo,
              child: const Text('Calcular Consumo'),
            ),
            const SizedBox(height: 20),

            if (_consumo > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consumo médio: ${_consumo.toStringAsFixed(2)} km/l'),
                  Text('Classificação: $_classificacao'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
