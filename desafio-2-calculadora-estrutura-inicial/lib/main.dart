import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    MeuApp(),
  );
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  var mensagemTela = '';

  Expanded createButtons(
      {String label, Color colorText, Color colorButton, Function onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colorButton,
          onPrimary: colorText,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }

  void setarValor(String valor) {
    setState(() {
      if (mensagemTela == '') {
        mensagemTela = valor;
      } else {
        mensagemTela += valor;
      }
    });
  }

  void resetar() {
    setState(() {
      mensagemTela = '';
    });
  }

  void realizarCalculo() {
    mensagemTela = mensagemTela.replaceAll('÷', '/');
    mensagemTela = mensagemTela.replaceAll('%', '/100');

    Parser p = Parser();
    Expression exp = p.parse(mensagemTela);
    ContextModel cm = ContextModel();
    double resultado = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      mensagemTela = resultado.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(15),
              height: 120,
              width: 400,
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$mensagemTela',
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          createButtons(
                            label: 'C',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {resetar()},
                          ),
                          createButtons(
                            label: 'DEL',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {resetar()},
                          ),
                          createButtons(
                            label: '%',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('%')},
                          ),
                          createButtons(
                            label: '÷',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('÷')},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          createButtons(
                            label: '7',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('7')},
                          ),
                          createButtons(
                            label: '8',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('8')},
                          ),
                          createButtons(
                            label: '9',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('9')},
                          ),
                          createButtons(
                            label: 'X',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('*')},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          createButtons(
                            label: '4',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('4')},
                          ),
                          createButtons(
                            label: '5',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('5')},
                          ),
                          createButtons(
                            label: '6',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('6')},
                          ),
                          createButtons(
                            label: '+',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('+')},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          createButtons(
                            label: '1',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('1')},
                          ),
                          createButtons(
                            label: '2',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('2')},
                          ),
                          createButtons(
                            label: '3',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('3')},
                          ),
                          createButtons(
                            label: '-',
                            colorText: Colors.redAccent.shade700,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('-')},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          createButtons(
                            label: '0',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('0')},
                          ),
                          createButtons(
                            label: '.',
                            colorText: Colors.white,
                            colorButton: Colors.black12,
                            onPressed: () => {setarValor('.')},
                          ),
                          createButtons(
                            label: '=',
                            colorText: Colors.white,
                            colorButton: Colors.redAccent.shade700,
                            onPressed: () => {realizarCalculo()},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
