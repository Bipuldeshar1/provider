import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/noteapp/provider/noteProvider.dart';
import 'package:statemgmt/noteapp/screen/add.dart';
import 'package:statemgmt/noteapp/screen/fav.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'note',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavScreen()));
              },
              icon: Icon(Icons.favorite))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Consumer<NoteProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: provider.notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: InkWell(
                            onTap: () {
                              value.remove(value.notes[index].id.toString());
                            },
                            child: Icon(Icons.remove),
                          ),
                          title: Text(value.notes[index].title.toString()),
                          subtitle:
                              Text(value.notes[index].description.toString()),
                    
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
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddScreen();
            },
            barrierDismissible: false,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
