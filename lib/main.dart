import 'package:flutter/material.dart';
import 'package:flutter_workout_tracker/constants.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Tracker',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: kPrimaryColor),
      ),
      home: const HomePage(title: 'WE GO JIM'),
    );
  }
}
