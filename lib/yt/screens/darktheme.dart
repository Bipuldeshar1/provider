import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/yt/provider/darktheme_provider.dart';
import 'package:statemgmt/yt/screens/count_example.dart';

class DarkThemeScreen extends StatefulWidget {
  DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CountExample()));
            },
            icon: Icon(Icons.abc),
          )
        ],
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("light mode"),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("dark mode"),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("system mode"),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          )
        ],
      ),
    );
  }
}
