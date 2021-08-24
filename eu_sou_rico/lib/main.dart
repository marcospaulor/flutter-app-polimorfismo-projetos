import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text('Eu sou rico!'),
        ),
        backgroundColor: Colors.red[50],
        body: Center(
          child: Image(
            image: AssetImage('images/rubi.png'),
          ),
        ),
      ),
    ),
  );
}
