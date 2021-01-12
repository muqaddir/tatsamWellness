import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'country.dart';

class Countries with ChangeNotifier {
  List<Country> _item = [];

  List<Country> get item {
    return [..._item];
  }

  void getdata() async {
    print("object");
    var response = await http.get('https://api.first.org/data/v1/countries');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map;
      var country = jsonResponse['data'] as Map;
      country.forEach((key, value) {
        value as Map;
        _item.add(Country(
            code: key.toString(),
            country: value['country'],
            region: value['region']));
      });
    }
    notifyListeners();
  }
}
