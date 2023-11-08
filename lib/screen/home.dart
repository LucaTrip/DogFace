import 'package:dogface/api/get_random_dog.dart';
import 'package:dogface/components/home_step_2.dart';
import 'package:dogface/components/home_step_3.dart';
import 'package:dogface/components/main_title.dart';
import 'package:dogface/components/simple_text.dart';
import 'package:dogface/provider/filter_model.dart';
import 'package:dogface/screen/list_view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:provider/provider.dart';

import '../api/get_dogs_by_breed.dart';
import '../api/get_dogs_by_breed_and_sub_breed.dart';
import '../components/home_step_1.dart';
import '../utils/utils.dart';

/**
 * I know that for performance reason display a possible long list of images is bad.
 * To resolve this problem it would be necessary use pagination (show only 10/20 items per time)
 * and other technics (compressing images, infinite scroll)
 */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var filterModel = context.watch<FilterModel>();

    return Column(
      children: [
        Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              filterModel.modalIsOpen == false &&
              filterModel.selectedMainFilter == "random_dog",
          widgetBuilder: (context) => const HomeStep1(),
          fallbackBuilder: (context) => Container(),
        ),
        Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              filterModel.modalIsOpen == false &&
              filterModel.selectedMainFilter == "by_breed" &&
              filterModel.selectedSubBreed.isEmpty,
          widgetBuilder: (context) => const HomeStep2(),
          fallbackBuilder: (context) => Container(),
        ),
        Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              filterModel.modalIsOpen == false &&
              filterModel.selectedMainFilter == "by_breed" &&
              filterModel.selectedSubBreed.isNotEmpty,
          widgetBuilder: (context) => const HomeStep3(),
          fallbackBuilder: (context) => Container(),
        ),
        Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                filterModel.modalIsOpen == false &&
                filterModel.selectedMainFilter.isEmpty &&
                filterModel.selectedSubBreed.isEmpty,
            widgetBuilder: (context) => Expanded(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleText(
                        text: "Discover your new four-legged friends 🐶"),
                    SimpleText(
                        text: "Play with filters to get awasome dog images")
                  ],
                ))),
            fallbackBuilder: (context) => Container())
      ],
    );
  }
}
