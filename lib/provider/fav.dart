import 'country.dart';
import 'package:flutter/material.dart';

class Favourite with ChangeNotifier {
  //Using map to efficiently add and remove Country
  //from favourite list
  Map<String, Country> _favitems = {};

  Map<String, Country> get getFav {
    return {..._favitems};
  }

  void add(Country value) {
    if (_favitems.containsKey(value.code)) {
      _favitems.remove(value.code);
    } else {
      _favitems.putIfAbsent(value.code, () => value);
    }
    ChangeNotifier();
  }
}
