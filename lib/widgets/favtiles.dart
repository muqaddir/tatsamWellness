import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tatsam/provider/country.dart';

class FavTiles extends StatefulWidget {
  @override
  _FavTilesState createState() => _FavTilesState();
}

class _FavTilesState extends State<FavTiles> {
  @override
  Widget build(BuildContext context) {
    final fav = context.watch<Country>();
    return Card(
        child: ListTile(
      leading: Text(fav.code),
      title: Text(fav.country),
      subtitle: Text(fav.region),
    ));
  }
}
