import 'package:flutter/foundation.dart';

class Country with ChangeNotifier {
  String code;
  String country;
  String region;
  bool isFav;

  Country(
      {@required this.code,
      @required this.country,
      @required this.region,
      this.isFav = false});

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
