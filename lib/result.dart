import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String text;
  const Result(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: TextStyle(fontSize: 28)));
  }
}
