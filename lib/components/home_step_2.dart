import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/get_dogs_by_breed.dart';
import '../provider/filter_model.dart';
import '../screen/list_view_image.dart';
import '../utils/utils.dart';
import 'main_title.dart';

class HomeStep2 extends StatelessWidget {
  const HomeStep2({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return FutureBuilder(
        future: fetchDogsByBreed(filterModel.selectedBreed),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var randomDogByBreedUrls = snapshot.data?.message;
            return Expanded(
                child: Column(
              children: [
                MainTitle(
                    text:
                        "You are watching ${capitalizeFirstLetter(filterModel.selectedBreed)}"),
                ListViewImage(
                  listSize: randomDogByBreedUrls!.length,
                  images: randomDogByBreedUrls,
                )
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
