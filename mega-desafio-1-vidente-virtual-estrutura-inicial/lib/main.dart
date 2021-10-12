import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: VidentVirtualPage(),
  ));
}

class VidentVirtualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff332B25),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Vidente Virtual 🔮',
          style: TextStyle(color: Colors.brown.shade500),
        ),
      ),
      body: Vidente(),
    );
  }
}

class Vidente extends StatefulWidget {
  @override
  _VidenteState createState() => _VidenteState();
}

class _VidenteState extends State<Vidente> {
  int numeroDaImagem = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.brown.shade100,
                ),
                onPressed: () {
                  setState(() {
                    numeroDaImagem = Random().nextInt(5) + 2;
                    print(numeroDaImagem);
                  });
                },
                child: Image.asset('imagens/vidente$numeroDaImagem.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
