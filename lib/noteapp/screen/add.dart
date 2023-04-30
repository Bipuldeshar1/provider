import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/noteapp/provider/noteProvider.dart';
import 'package:statemgmt/noteapp/screen/home.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'description',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<NoteProvider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () {
                      value.AddNotes(
                        titleController.text.toString(),
                        descriptionController.text.toString(),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const Text(
                      'save',
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
