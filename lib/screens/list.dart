import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tatsam/provider/countries.dart';
import 'package:tatsam/widgets/listtile.dart';
import 'package:connectivity/connectivity.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var connections;
  bool network = true;

  @override
  void initState() {
    super.initState();
    connections = Connectivity().onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        context.read<Countries>().getdata();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    connections.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final countriesData = context.watch<Countries>().item;
    return Scaffold(
        body: StreamBuilder<Object>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data == ConnectivityResult.mobile ||
                  snapshot.data == ConnectivityResult.wifi) {
                return Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: countriesData.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: countriesData[i],
                        child: Tiles(),
                      ),
                    ));
              }
              return Container(
                child: Center(
                  child: Text("No Connection"),
                ),
              );
            }));
  }
}
