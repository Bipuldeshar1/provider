import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotofyListnerScreen extends StatelessWidget {
  NotofyListnerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('statless'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toogle,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return TextFormField(
                obscureText: toogle.value,
                decoration: InputDecoration(
                  hintText: 'psw',
                  suffixIcon: InkWell(
                    onTap: () {
                      toogle.value = !toogle.value;
                    },
                    child: Icon(
                      toogle.value ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
