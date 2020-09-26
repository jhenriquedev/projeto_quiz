import 'package:flutter/material.dart';

class Pergunta extends StatelessWidget {
  final String texto;

  //Construtor
  Pergunta(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// option + shift + f => formatar código
