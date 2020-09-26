import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() reiniciarPerguntas;

  //Construtor
  Resultado(this.pontos, this.reiniciarPerguntas);

  String get fraseResultado {
    if (pontos < 8) {
      return 'Fail';
    } else {
      return 'Victory!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            '$pontos',
            style: TextStyle(fontSize: 28),
          )),
          Center(
              child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          )),
          FlatButton(
            child: Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18,
              )),
            textColor: Colors.blue,
            onPressed: reiniciarPerguntas
          )
        ],
      ),
    );
  }
}

// option + shift + f => formatar código
