import 'package:flutter/material.dart';

import '../model/filter.dart';

class FilterModel extends ChangeNotifier {
  bool _modalIsOpen = false;
  String _selectedMainFilter = "";
  String _selectedBreed = "";
  String _selectedSubBreed = "";

  final List<Filter> _mainFilters = [
    Filter("random_dog", "Random dog", false),
    Filter("by_breed", "Filter by breed", false),
  ];

  Map<String, List<String>> _allBreeds = {};
  List<String> _allBreedsFormatted = [];
  List<String> _subBreedsFormatted = [];

  bool get modalIsOpen => _modalIsOpen;
  String get selectedMainFilter => _selectedMainFilter;
  String get selectedBreed => _selectedBreed;
  String get selectedSubBreed => _selectedSubBreed;

  Map<String, List<String>> get allBreeds => _allBreeds;

  List<Filter> get mainFilters => _mainFilters;
  List<String> get allBreedsFormatted => _allBreedsFormatted;
  List<String> get subBreedsFormatted => _subBreedsFormatted;

  void changeModalState(bool newState) {
    _modalIsOpen = newState;
    notifyListeners();
  }

  void changeMainFilter(String filterId) {
    var selectedFilter =
        _mainFilters.firstWhere((element) => element.id == filterId);

    if (selectedFilter.isSelected == false) {
      for (var i = 0; i < _mainFilters.length; i++) {
        _mainFilters[i].isSelected = false;
      }

      selectedFilter.isSelected = true;
      _selectedMainFilter = selectedFilter.id;
      _selectedSubBreed = "";
      _selectedBreed = "";
      _subBreedsFormatted.clear();

      notifyListeners();
    }
  }

  void addBreeds(Map<String, List<String>> breeds) {
    _allBreeds = breeds;

    breeds.forEach((key, value) => allBreedsFormatted.add(key));

    notifyListeners();
  }

  void setBreed(String newBreed) {
    _selectedBreed = newBreed.toLowerCase();

    _subBreedsFormatted.clear();
    _selectedSubBreed = "";

    var tempSubBreed = _allBreeds[_selectedBreed];
    if (tempSubBreed!.isNotEmpty) {
      for (var subBreed in tempSubBreed) {
        _subBreedsFormatted.add(subBreed);
      }
    }

    notifyListeners();
  }

  void setSubBreed(String newSubBreed) {
    _selectedSubBreed = newSubBreed;
    notifyListeners();
  }
}
