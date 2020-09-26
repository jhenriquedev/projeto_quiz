import 'package:flutter/material.dart';

import './pergunta.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  //final Widget pergunta;
  //final List<Widget> respostas;

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;
  final bool nextQuestion;

  //Construtor
  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
    @required this.nextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        nextQuestion ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Pergunta(
              perguntas[perguntaSelecionada]['texto']), //componente importado
          ...respostas.map((item) {
            return Resposta(item['texto'], () => responder(item['nota']));
          }).toList(),
        ],
      ),
    );
  }
}

// option + shift + f => formatar código
