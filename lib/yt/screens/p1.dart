import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/yt/provider/p1_provider.dart';

class P1 extends StatefulWidget {
  P1({Key? key}) : super(key: key);

  @override
  State<P1> createState() => _P1State();
}

class _P1State extends State<P1> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<P1Provider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<P1Provider>(builder: (context, v, child) {
            return Slider(
                min: 0,
                max: 1,
                value: v.value,
                onChanged: (val) {
                  v.setvaue(val);
                });
          }),
          Consumer<P1Provider>(builder: (context, v, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(v.value),
                    ),
                    child: const Center(
                      child: Text('container'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                        BoxDecoration(color: Colors.red.withOpacity(v.value)),
                    child: const Center(
                      child: Text('container'),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
