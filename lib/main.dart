import 'package:flutter/material.dart';

import 'package:tatsam/provider/countries.dart';
import 'package:tatsam/provider/fav.dart';
import 'package:tatsam/screens/favourite.dart';
import 'package:tatsam/screens/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => Countries()),
    ChangeNotifierProvider(create: (ctx) => Favourite())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tatsam',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue[900],
                centerTitle: true,
                title: Text("Tatsam"),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.list),
                      text: "List",
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: "Favourite",
                    ),
                  ],
                ),
              ),
              body: TabBarView(children: [
                ListPage(),
                FavouritePage(),
              ]),
            ),
          ),
        ));
  }
}
