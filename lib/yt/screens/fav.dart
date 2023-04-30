import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/yt/provider/fav_provider.dart';
import 'package:statemgmt/yt/screens/myFav.dart';

class Favourite extends StatefulWidget {
  Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('fav'),
        actions: [
          Row(
            children: [
              InkWell(
                child: Icon(Icons.favorite),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyFavScreen()));
                },
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
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
        ],
      ),
    );
  }
}
