import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade700,
        appBar: AppBar(
          title: Text('Dadoos'),
          backgroundColor: Colors.teal.shade900,
        ),
        body: Dadoos(),
      ),
    ),
  );
}

class Dadoos extends StatefulWidget {
  @override
  _DadoosState createState() => _DadoosState();
}

class _DadoosState extends State<Dadoos> {
  int numeroDadoEsquerdo = 1;
  int numeroDadoDireito = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  numeroDadoEsquerdo = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('imagens/dado$numeroDadoEsquerdo.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  numeroDadoDireito = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('imagens/dado$numeroDadoDireito.png'),
            ),
          ),
        ],
      ),
    );
  }
}
