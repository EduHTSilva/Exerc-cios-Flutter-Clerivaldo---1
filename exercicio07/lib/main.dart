import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reajuste Salarial',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const reajustesalary(),
    );
  }
}

class reajustesalary extends StatefulWidget {
  const reajustesalary({super.key});

  @override
  State<reajustesalary> createState() => _reajustesalaryState();
}

class _reajustesalaryState extends State<reajustesalary> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _salarioController = TextEditingController();
  final TextEditingController _percentualController = TextEditingController();

  double _newSalary = 0.0;
  double aumento = 0.0;

  void _calculateNewSalary() {
    final double salario = double.tryParse(_salarioController.text) ?? 0.0;
    final double percentualReajuste =
        double.tryParse(_percentualController.text) ?? 0.0;

    setState(() {
      aumento = salario * (percentualReajuste / 100);
      _newSalary = salario + aumento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reajuste Salarial')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Funcionário',
              ),
            ),
            TextField(
              controller: _salarioController,
              decoration: const InputDecoration(labelText: 'Salário Atual'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _percentualController,
              decoration: const InputDecoration(
                labelText: 'Percentual de Reajuste',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateNewSalary,
              child: const Text('Calcular Novo Salário'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nomeController.clear();
                  _salarioController.clear();
                  _percentualController.clear();
                  _newSalary = 0.0;
                  aumento = 0.0;
                });
              },
              child: const Text('Limpar'),
            ),
            const SizedBox(height: 20),
            if (_newSalary > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Funcionario: ${_nomeController.text}'),

                  Text('Salario Atual: R\$ ${_salarioController.text}'),
                  Text('Aumento: R\$ ${aumento.toStringAsFixed(2)}'),
                  Text('Novo Salário: R\$ ${_newSalary.toStringAsFixed(2)}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
