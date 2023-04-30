import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/yt/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    print('z');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('count'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
              return Text(
                value.count.toString(),
              );
            }),
          ),
          ElevatedButton(
              onPressed: () {
                countProvider.decremet();
              },
              child: Icon(Icons.exposure_minus_1))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
