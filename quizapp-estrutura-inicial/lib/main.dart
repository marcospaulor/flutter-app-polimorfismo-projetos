import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = new Helper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCorreta = helper.obterResposta();

    setState(() {
      if (helper.confereFimDoTeste() == true) {
        Alert(
          context: context,
          title: 'Fim do Teste',
          desc: 'As perguntas acabaram!',
          style: AlertStyle(
            backgroundColor: Colors.deepPurpleAccent.shade700,
            titleStyle: TextStyle(color: Colors.white),
            descStyle: TextStyle(color: Colors.white),
          ),
          buttons: [
            DialogButton(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.greenAccent[400],
            ),
          ],
        ).show();

        helper.resetarTeste();

        marcadorDePontos.clear();
      } else {
        if (respostaSelecionadaPeloUsuario == respostaCorreta) {
          marcadorDePontos.add(Icon(Icons.check, color: Colors.green));
        } else {
          marcadorDePontos.add(Icon(Icons.close, color: Colors.red));
        }
        helper.proximoPergunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        ),
      ],
    );
  }
}

/*
pergunta1: 'O metrô é um dos meios de transporte mais seguros do mundo', verdadeiro,
pergunta2: 'A culinária brasileira é uma das melhores do mundo.', verdadeiro,
pergunta3: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', falso,
*/


// textColor: Colors.white,
// color: Colors.deepPurple,


// color: Colors.grey.shade800,