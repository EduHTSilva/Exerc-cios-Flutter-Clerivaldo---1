import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema simples de vendas',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const SistemaDeVendas(title: 'Sistema simples de vendas'),
    );
  }
}

class SistemaDeVendas extends StatefulWidget {
  const SistemaDeVendas({super.key, required this.title});

  final String title;

  @override
  State<SistemaDeVendas> createState() => _SistemaDeVendasState();
}

class _SistemaDeVendasState extends State<SistemaDeVendas> {
  final TextEditingController _nomeProdutoController = TextEditingController();
  final TextEditingController _precoUnitarioController =
      TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  double desconto = 0.0;
  double total = 0.0;
  double _subTotal = 0.0;

  void calcularSubTotal() {
    double precoUnitario =
        double.tryParse(_precoUnitarioController.text) ?? 0.0;
    int quantidade = int.tryParse(_quantidadeController.text) ?? 0;
    _subTotal = precoUnitario * quantidade;
    setState(() {
      if (_subTotal > 500) {
        desconto = _subTotal * 0.1;
      } else {
        desconto = 0.0;
      }
      total = _subTotal - desconto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeProdutoController,
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: _precoUnitarioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço Unitário (R\$)',
              ),
            ),
            TextField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Produtos',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularSubTotal,
              child: const Text('Calcular Subtotal e Desconto'),
            ),
            const SizedBox(height: 20),
            if (total > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Produto: ${_nomeProdutoController.text}'),
                  Text('Quantidade: ${_quantidadeController.text}'),
                  Text('Subtotal: R\$ ${_subTotal.toStringAsFixed(2)}'),
                  Text('Desconto: R\$ ${desconto.toStringAsFixed(2)}'),
                  Text('Total: R\$ ${total.toStringAsFixed(2)}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
