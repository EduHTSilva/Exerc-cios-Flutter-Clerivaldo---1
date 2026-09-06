import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Estoque',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const SistemaDeEstoque(title: 'Controle de Estoque'),
    );
  }
}

class SistemaDeEstoque extends StatefulWidget {
  const SistemaDeEstoque({super.key, required this.title});

  final String title;

  @override
  State<SistemaDeEstoque> createState() => _SistemaDeEstoqueState();
}

class _SistemaDeEstoqueState extends State<SistemaDeEstoque> {
  final TextEditingController _quantidadeController = TextEditingController();
  int quantidadeTotal = 0;
  String mensagem = '';

  void adicionarProduto() {
    int quantidade = int.tryParse(_quantidadeController.text) ?? 0;
    setState(() {
      quantidadeTotal += quantidade;
      mensagem = 'Produto adicionado com sucesso.';
    });
  }

  void removerProduto() {
    int quantidade = int.tryParse(_quantidadeController.text) ?? 0;
    setState(() {
      if (quantidadeTotal < quantidade) {
        mensagem = 'Quantidade insuficiente em estoque.';
      } else {
        quantidadeTotal -= quantidade;
        mensagem = 'Produto removido com sucesso.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    adicionarProduto();
                    _quantidadeController.clear();
                    Text(
                      mensagem,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 26, 255, 0),
                      ),
                    );
                  },
                  child: const Text('Adicionar Produto'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    removerProduto();
                    _quantidadeController.clear();
                    Text(
                      mensagem,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 0, 8),
                      ),
                    );
                  },
                  child: const Text('Remover Produto'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _quantidadeController.clear();
                setState(() {
                  quantidadeTotal = 0;
                  mensagem = 'Estoque zerado.';
                });
              },
              child: const Text('Zerar Estoque'),
            ),
            const SizedBox(height: 16.0),
            Text('Quantidade atual em estoque: $quantidadeTotal'),
            const SizedBox(height: 8.0),
            Text(mensagem, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
