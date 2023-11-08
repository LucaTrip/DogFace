import 'package:flutter/material.dart';

import '../api/get_random_dog.dart';
import '../screen/list_view_image.dart';
import 'main_title.dart';

class HomeStep1 extends StatefulWidget {
  const HomeStep1({super.key});

  @override
  State<StatefulWidget> createState() => _HomeStep1();
}

class _HomeStep1 extends State<HomeStep1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchRandomDog(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var randomDogUrl = snapshot.data?.message;
            return Expanded(
                child: Column(
              children: [
                MainTitle(text: "You are watching a random dog"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Refresh Image")),
                ),
                ListViewImage(images: [randomDogUrl!], listSize: 1),
              ],
            ));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        });
  }
}
