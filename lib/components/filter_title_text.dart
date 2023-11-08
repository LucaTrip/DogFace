import 'package:flutter/material.dart';

class FilterTitleText extends StatelessWidget {
  String text;
  FilterTitleText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
