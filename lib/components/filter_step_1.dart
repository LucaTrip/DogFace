import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/filter.dart';
import '../provider/filter_model.dart';
import 'filter_title_text.dart';

class FilterStep1 extends StatelessWidget {
  const FilterStep1({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();
    var mainFilters = context.select<FilterModel, List<Filter>>(
      (item) => item.mainFilters,
    );

    return Column(children: [
      Row(
        children: [
          FilterTitleText(text: "Select main filter"),
        ],
      ),
      Wrap(
        spacing: 5.0,
        children: mainFilters
            .map((filter) => ChoiceChip(
                  label: Text(filter.label),
                  selected: filter.isSelected,
                  onSelected: (bool selected) {
                    filterModel.changeMainFilter(filter.id);
                  },
                ))
            .toList(),
      )
    ]);
  }
}
