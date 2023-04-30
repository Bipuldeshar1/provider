import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/noteapp/provider/noteProvider.dart';

class FavScreen extends StatefulWidget {
  FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('fav')),
      body: ListView.builder(
        itemCount: provider.fav.length,
        itemBuilder: (BuildContext context, int index) {
          return Consumer<NoteProvider>(builder: (context, value, child) {
            return ListTile(
              title: Text(value.notes[index].title.toString()),
              subtitle: Text(value.notes[index].id.toString()),
              trailing: InkWell(
                onTap: () {
                  if (value.fav.contains(index)) {
                    value.removeFav(index);
                  } else {
                    value.addFav(index);
                  }
                },
                child: value.fav.contains(index)
                    ? Icon(Icons.favorite)
                    : Icon(
                        Icons.favorite_outline,
                      ),
              ),
            );
          });
        },
      ),
    );
  }
}
