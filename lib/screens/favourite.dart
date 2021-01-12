import 'package:flutter/material.dart';
import 'package:tatsam/widgets/favtiles.dart';
import '../provider/fav.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final favData = context.watch<Favourite>().getFav;
    if (favData.isEmpty) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Text("No Item is selected"),
          ),
        ),
      );
    }
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: favData.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: favData.values.toList()[i],
                    child: FavTiles(),
                  ))),
    );
  }
}
