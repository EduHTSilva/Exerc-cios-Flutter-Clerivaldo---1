import 'package:flutter/material.dart';

void main() {
  runApp(exe01());
}

class exe01 extends StatelessWidget {
  const exe01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: identificacao(),
    );
  }
}

class identificacao extends StatefulWidget {
  const identificacao({super.key});

  @override
  State<identificacao> createState() => _identificacaoState();
}

class _identificacaoState extends State<identificacao> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String mensagem = '';

  void mostrar() {
    setState(() {
      mensagem =
          'Olá ${nomeController.text}! Você mora em ${cidadeController.text}';
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      cidadeController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Identificação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: cidadeController,
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: mostrar,
                  child: const Text('Mostrar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
