import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  String text;
  MainTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: FittedBox(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              )),
        ))
      ],
    );
  }
}
