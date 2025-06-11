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
  var _pontuacaoTotal = 0;
  // lista usada para o Texto da pergunta e suas respostas é uma lista de map
  final _perguntas = [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'LeÃo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Léo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},

        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];
  bool get isSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  // responder é uma função que muda o estado com o setState
  void _responder(int pontuacao) {
    if (isSelectedQuestion) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _restartQuestionnaire() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
                : Result(_pontuacaoTotal, _restartQuestionnaire),
      ),
    );
  }
}
