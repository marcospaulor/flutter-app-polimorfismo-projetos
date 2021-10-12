import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MarimbaApp());

class MarimbaApp extends StatelessWidget {
  void tocarTom(int num) {
    final player = AudioCache();
    player.play('nota$num.wav');
  }

  Expanded criarBotao({Color cor, int numeroDaNota}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: cor,
        ),
        onPressed: () {
          tocarTom(numeroDaNota);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              criarBotao(cor: Colors.red, numeroDaNota: 1),
              criarBotao(cor: Colors.orange, numeroDaNota: 2),
              criarBotao(cor: Colors.yellow, numeroDaNota: 3),
              criarBotao(cor: Colors.green, numeroDaNota: 4),
              criarBotao(cor: Colors.blue, numeroDaNota: 5),
              criarBotao(cor: Colors.purple, numeroDaNota: 6),
              criarBotao(cor: Colors.pink, numeroDaNota: 7),
            ],
          ),
        ),
      ),
    );
  }
}
