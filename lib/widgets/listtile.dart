import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tatsam/provider/country.dart';
import 'package:tatsam/provider/fav.dart';

class Tiles extends StatefulWidget {
  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    final countryData = context.watch<Country>();
    return Card(
        child: ListTile(
      leading: Text(countryData.code),
      title: Text(countryData.country),
      subtitle: Text(countryData.region),
      trailing: IconButton(
        onPressed: () {
          countryData.toggleFav();
          context.read<Favourite>().add(countryData);
        },
        icon: Icon(countryData.isFav == false
            ? Icons.favorite_border
            : Icons.favorite),
      ),
    ));
  }
}
