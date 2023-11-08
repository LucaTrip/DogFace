import 'package:flutter/material.dart';

class ListViewImage extends StatelessWidget {
  int listSize = 0;
  List<String> images = [];

  ListViewImage({super.key, required this.images, required this.listSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listSize,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            images[index],
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(),
          ),
        ),
      ),
    ));
  }
}
