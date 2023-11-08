import 'package:dogface/screen/home.dart';
import 'package:dogface/provider/filter_model.dart';
import 'package:dogface/components/filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/filter.dart';

void main() {
  runApp(ChangeNotifierProvider<FilterModel>(
    create: (context) => FilterModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DogFace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text("DogFace"),
          actions: [
            TextButton(
                onPressed: () {
                  filterModel.changeModalState(true);

                  showModalBottomSheet(
                      enableDrag: false,
                      isScrollControlled: true,
                      isDismissible: false,
                      context: context,
                      builder: (builder) => const FilterModal());
                },
                child: const Text("Filter"))
          ],
        ),
        body: const HomePage());
  }
}
