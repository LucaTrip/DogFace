import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/get_dogs_by_breed_and_sub_breed.dart';
import '../provider/filter_model.dart';
import '../screen/list_view_image.dart';
import '../utils/utils.dart';
import 'main_title.dart';

class HomeStep3 extends StatelessWidget {
  const HomeStep3({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return FutureBuilder(
        future: fetchDogsByBreedAndSubBreed(
            filterModel.selectedBreed, filterModel.selectedSubBreed),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var randomDogByBreedAndSubBreedUrls = snapshot.data?.message;
            return Expanded(
                child: Column(
              children: [
                MainTitle(
                    text:
                        "You are watching ${capitalizeFirstLetter(filterModel.selectedSubBreed)} ${capitalizeFirstLetter(filterModel.selectedBreed)}"),
                ListViewImage(
                  listSize: randomDogByBreedAndSubBreedUrls!.length,
                  images: randomDogByBreedAndSubBreedUrls,
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
