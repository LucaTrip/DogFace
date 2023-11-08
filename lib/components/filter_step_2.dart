import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/get_all_breeds.dart';
import '../provider/filter_model.dart';
import 'filter_title_text.dart';

class FilterStep2 extends StatelessWidget {
  const FilterStep2({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();
    var allBreeds = context.select<FilterModel, List<String>>(
      (item) => item.allBreedsFormatted,
    );

    return Column(children: [
      Row(
        children: [
          FilterTitleText(text: "Select dog breed"),
        ],
      ),
      allBreeds.isEmpty
          ? FutureBuilder(
              future: fetchAllBreeds(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  filterModel.addBreeds(snapshot.data!.message);
                  return const InnerChoiceChipList();
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }

                return const Center(child: CircularProgressIndicator());
              })
          : const InnerChoiceChipList(),
    ]);
  }
}

class InnerChoiceChipList extends StatelessWidget {
  const InnerChoiceChipList({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();
    var allBreeds = context.select<FilterModel, List<String>>(
      (item) => item.allBreedsFormatted,
    );

    void onUpdateProvider(String breed) {
      filterModel.setBreed(breed);
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
          child: Wrap(
        spacing: 5.0,
        children: allBreeds
            .map((breed) => ChoiceChip(
                  label: Text(breed),
                  selected: breed.toLowerCase() == filterModel.selectedBreed,
                  onSelected: (bool selected) {
                    onUpdateProvider(breed);
                  },
                ))
            .toList(),
      )),
    );
  }
}
