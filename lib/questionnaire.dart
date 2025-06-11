import 'package:flutter/material.dart';
import 'package:flutter_question_project/answer.dart';
import 'package:flutter_question_project/question.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) onPressed;

  const Questionnaire({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.onPressed,
    super.key,
  });

  bool get isSelectQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final answers =
        isSelectQuestion
            ? perguntas[perguntaSelecionada]['respostas']
                as List<Map<String, Object>>
            : [];
    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['texto'].toString()),
        ...answers.map((answer) {
          return Answer(answer['texto'], () => onPressed(answer['pontuacao']));
        }),
      ],
    );
  }
}
