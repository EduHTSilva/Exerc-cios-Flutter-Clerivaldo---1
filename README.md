# Flutter — Lista de Exercícios

## Informações

**Aluno:** Eduardo Henrique Taborda e Silva
**Turma:** Ciência da Computação - 6º semestre
**Disciplina:** Programação de dispositivos moveis - Clerivaldo José Roccia - Noturno
**Atividade:** Lista de Exercícios — Revisão dos conteúdos trabalhados até a aula passada

## Sobre a atividade

Este repositório contém os exercícios desenvolvidos em **Flutter** como parte da lista de revisão da disciplina.

Os exercícios foram desenvolvidos utilizando somente os conteúdos trabalhados até a aula anterior ao conteúdo de **Listas e Cards**, conforme as orientações da atividade.

## Exercícios

| Exercício | Descrição                       |
| --------- | ------------------------------- |
| 01        | Identificação do usuário        |
| 02        | Verificador de idade            |
| 03        | Antecessor e sucessor           |
| 04        | Conversor de temperatura        |
| 05        | Calculadora de média            |
| 06        | Calculadora de quatro operações |
| 07        | Reajuste salarial               |
| 08        | Consumo de combustível          |
| 09        | Sistema simples de vendas       |
| 10        | Controle de estoque             |

## Conteúdos utilizados

Os exercícios utilizam os seguintes recursos do Flutter:

* `MaterialApp`
* `Scaffold`
* `AppBar`
* `StatelessWidget`
* `StatefulWidget`
* `Column`
* `Row`
* `SizedBox`
* `Padding`
* `EdgeInsets.all()`
* `MainAxisAlignment`
* `TextField`
* `TextEditingController`
* `keyboardType`
* `InputDecoration`
* `ElevatedButton`
* `onPressed`
* Funções
* `setState()`
* `int.tryParse()`
* `double.tryParse()`
* Operador `??`
* `if` e `else`
* Interpolação de Strings
* `Text`
* `TextStyle`
* `toStringAsFixed()`
* `clear()`
* `dispose()`
* `super.dispose()`

## Estrutura do repositório

```text
flutter-lista-exercicios-eduardo/
│
├── README.md
│
├── exercicio01/
├── exercicio02/
├── exercicio03/
├── exercicio04/
├── exercicio05/
├── exercicio06/
├── exercicio07/
├── exercicio08/
├── exercicio09/
└── exercicio10/
```

Cada pasta contém o respectivo projeto/exercício desenvolvido em Flutter.

## Restrições

Nesta atividade não foram utilizados recursos pertencentes ao conteúdo posterior da disciplina, como:

* `List`
* `ListView`
* `ListView.builder`
* `Card`
* `ListTile`
* `Navigator`
* Múltiplas telas
* `Expanded` aplicado a listas
* `Form`
* `TextFormField`

## Observações

Os exercícios foram desenvolvidos considerando também situações de erro, como:

* Entrada de valores inválidos;
* Divisão por zero;
* Tentativa de retirada de uma quantidade maior que o estoque disponível.

Todos os `TextEditingController` utilizados são liberados com `dispose()` e `super.dispose()`.

---

**Flutter — Lista de Exercícios**
Revisão dos conteúdos trabalhados até a aula passada.
