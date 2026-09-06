import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificador de Idade',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: AgeChecker(),
    );
  }
}

class AgeChecker extends StatefulWidget {
  const AgeChecker({super.key});

  @override
  _AgeCheckerState createState() => _AgeCheckerState();
}

class _AgeCheckerState extends State<AgeChecker> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _result = '';

  void _checkAge() {
    String name = _nameController.text;
    int? age = int.tryParse(_ageController.text);

    if (age == null) {
      setState(() {
        _result = 'Por favor, insira uma idade válida.';
      });
      return;
    }

    if (age >= 18) {
      setState(() {
        _result = '$name é maior de idade.';
      });
    } else {
      setState(() {
        _result = '$name é menor de idade.';
      });
    }
  }

  void _clearFields() {
    _nameController.clear();
    _ageController.clear();
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de Idade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _checkAge, child: Text('Verificar')),
                ElevatedButton(onPressed: _clearFields, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
