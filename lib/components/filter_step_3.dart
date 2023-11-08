import 'package:dogface/components/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filter_model.dart';
import 'filter_title_text.dart';

class FilterStep3 extends StatelessWidget {
  const FilterStep3({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return Column(children: [
      Row(
        children: [
          FilterTitleText(text: "Select dog sub-breed"),
        ],
      ),
      filterModel.subBreedsFormatted.isNotEmpty
          ? Wrap(
              spacing: 5.0,
              children: filterModel.subBreedsFormatted
                  .map((subBreed) => ChoiceChip(
                        label: Text(subBreed),
                        selected: subBreed == filterModel.selectedSubBreed,
                        onSelected: (bool selected) {
                          filterModel.setSubBreed(subBreed);
                        },
                      ))
                  .toList(),
            )
          : SimpleText(text: "This breed has no sub-breeds")
    ]);
  }
}
