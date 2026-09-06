import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antecessor e Sucessor',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: antesucessor(),
    );
  }
}

class antesucessor extends StatefulWidget {
  const antesucessor({super.key});

  @override
  _antesucessorState createState() => _antesucessorState();
}

class _antesucessorState extends State<antesucessor> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _calculate() {
    int? number = int.tryParse(_numberController.text);

    if (number == null) {
      setState(() {
        _result = 'Por favor, insira um número válido.';
      });
      return;
    }

    int Antecessor = number - 1;
    int Sucessor = number + 1;

    setState(() {
      _result =
          'Numero: $number \n Antecessor: $Antecessor \n Sucessor: $Sucessor';
    });
  }

  void _clearFields() {
    _numberController.clear();
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antecessor e Sucessor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _calculate, child: Text('Calcular')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _clearFields, child: Text('Limpar')),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
