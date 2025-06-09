import 'package:flutter/material.dart';

void main() {
  runApp(QuestionApp());
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      print(perguntaSelecionada++);
    });

    print('Pergunta Respondida');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      ' Qual é a seu animal favorito?',
      'Qual a sua cor favorita?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              onPressed: () {
                responder();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              child: Text('Clique Aqui'),
            ),
            ElevatedButton(
              onPressed: () {
                responder();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              child: Text('Clique Aqui'),
            ),
            ElevatedButton(
              onPressed: () {
                responder();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              child: Text('Clique Aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
