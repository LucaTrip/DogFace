import 'package:dogface/components/filter_step_1.dart';
import 'package:dogface/components/filter_step_2.dart';
import 'package:dogface/components/filter_step_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:provider/provider.dart';

import '../provider/filter_model.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).copyWith().size.height * 0.90,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  FilterStep1(),
                  Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                          filterModel.selectedMainFilter == "by_breed",
                      widgetBuilder: (BuildContext context) =>
                          const FilterStep2(),
                      fallbackBuilder: (BuildContext context) => Container()),
                  Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                          filterModel.selectedBreed.isNotEmpty,
                      widgetBuilder: (BuildContext context) => FilterStep3(),
                      fallbackBuilder: (BuildContext context) => Container()),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: FilledButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text(
                  "Apply",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  filterModel.changeModalState(false);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
