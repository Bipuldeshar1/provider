import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fav_provider.dart';

class MyFavScreen extends StatefulWidget {
  MyFavScreen({Key? key}) : super(key: key);

  @override
  State<MyFavScreen> createState() => _MyFavScreenState();
}

class _MyFavScreenState extends State<MyFavScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: favProvider.selectedItem.length,
            itemBuilder: (context, index) {
              return Consumer<FavProvider>(builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.selectedItem.contains(index)) {
                      value.remove(index);
                    } else {
                      value.addItem(index);
                    }
                  },
                  title: Text(
                    'item' + index.toString(),
                  ),
                  trailing: value.selectedItem.contains(index)
                      ? Icon(Icons.favorite)
                      : Icon(
                          Icons.favorite_outline,
                        ),
                );
              });
            },
          ),
        )
      ]),
    );
  }
}
