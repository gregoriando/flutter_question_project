import 'package:flutter/material.dart';
import 'package:flutter_question_project/questionnaire.dart';
import 'package:flutter_question_project/result.dart';

void main() {
  runApp(QuestionApp());
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  var _perguntaSelecionada = 0; // contador
  // lista usada para o Texto da pergunta e suas respostas é uma lista de map
  final _perguntas = [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Léo', 'Pedro'],
    },
  ];
  bool get isSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  // responder é uma função que muda o estado com o setState
  void _responder() {
    if (isSelectedQuestion) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  // Garante que não vai dar erro porque o tamanho se for menor do que o tamanho de perguntas nao renderiza

  @override
  Widget build(BuildContext context) {
    //Verifica se o tamanho de pergunta selecionada é menor que perguntas e retorna lista se sim e null se nÃo

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body:
            isSelectedQuestion
                ? Questionnaire(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  onPressed: _responder,
                )
                : Result('Parabéns!'),
      ),
    );
  }
}
