import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() onPressedQuestionnaire;

  String get resultPhrase {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi!';
    }
  }

  const Result(this.pontuacao, this.onPressedQuestionnaire, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(resultPhrase, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: onPressedQuestionnaire,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            textStyle: TextStyle(fontSize: 18),
          ),
          child: Text('Reiniciar'),
        ),
      ],
    );
  }
}
