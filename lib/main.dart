import 'package:flutter/material.dart';

//importações
import './questionario.dart';
import './resultado.dart';

main() => runApp(ProjetoQuiz());

//classe que controla o state
class _ProjetoQuizState extends State<ProjetoQuiz> {
  var _perguntaSelecionada = 0;
  int _pontos = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 10},
        {'texto': 'Verde', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 7},
        {'texto': 'Outra', 'nota': 3},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cão', 'nota': 1},
        {'texto': 'Gato', 'nota': 10},
        {'texto': 'Peixe', 'nota': 5},
        {'texto': 'Outro', 'nota': 8},
      ]
    },
    {
      'texto': 'Qual é o seu esporte favorito?',
      'respostas': [
        {'texto': 'Natação', 'nota': 4},
        {'texto': 'Volei', 'nota': 8},
        {'texto': 'Futebol', 'nota': 7},
        {'texto': 'Outro', 'nota': 2},
      ]
    }
  ];

  void _responder(int pontuacao) => nextQuestion
      ? setState(() {
          _perguntaSelecionada++;
          _pontos += pontuacao;
        })
      : {};

  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontos = 0;
    });
  }

  bool get nextQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Projeto Quiz'),
        ),
        body: nextQuestion
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder, //pegando parametro do filho
                nextQuestion: nextQuestion)
            : Resultado(_pontos,_reiniciarPerguntas),
      ),
    );
  }
}

class ProjetoQuiz extends StatefulWidget {
  _ProjetoQuizState createState() {
    return _ProjetoQuizState();
  }
}
