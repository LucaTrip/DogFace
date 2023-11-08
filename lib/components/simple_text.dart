import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  String text;
  SimpleText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}
