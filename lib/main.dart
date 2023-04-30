import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemgmt/noteapp/provider/noteProvider.dart';

import 'package:statemgmt/noteapp/screen/home.dart';
import 'package:statemgmt/yt/provider/count_provider.dart';
import 'package:statemgmt/yt/provider/darktheme_provider.dart';
import 'package:statemgmt/yt/provider/fav_provider.dart';
import 'package:statemgmt/yt/provider/p1_provider.dart';
import 'package:statemgmt/yt/screens/darktheme.dart';
import 'package:statemgmt/yt/screens/fav.dart';
import 'package:statemgmt/yt/screens/login.dart';
import 'package:statemgmt/yt/screens/notifylistner.dart';
import 'package:statemgmt/yt/screens/p1.dart';
import 'package:statemgmt/yt/screens/count_example.dart';

import 'yt/provider/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => P1Provider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => NoteProvider(),
          )
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.purple,
            ),
            home: HomeScreen(),
          );
        }));
  }
}
