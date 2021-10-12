import 'package:flutter/material.dart';

void main() {
  runApp(
    MeuApp(),
  );
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent.shade700,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 50.0,
                backgroundImage: AssetImage("images/perfil4.jpg"),
              ),
              Text(
                "Marcos Paulo",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'DancingScript'),
              ),
              Text(
                "DEV. FLUTTER",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 250.0,
                child: Divider(color: Colors.white),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.redAccent.shade700,
                    ),
                    title: Text(
                      "+55 64 9 92123123",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      size: 25.0,
                      color: Colors.redAccent.shade700,
                    ),
                    title: Text(
                      "silva.marcos@ufcat.br",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SourceSansPro',
                          fontSize: 17.9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
