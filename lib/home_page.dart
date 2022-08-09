import 'package:flutter/material.dart';
import 'package:flutter_workout_tracker/add_page.dart';
import 'package:flutter_workout_tracker/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> entries = <String>["Day 1", "Day 2", "Day 3"];
    final List<int> colors = <int>[600, 400];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: [
          // graph summary
          Container(
            height: size.height * 0.3,
            color: Colors.amberAccent,
            child: const Center(
              child: Text("dis graph"),
            ),
          ),
          // Workout detail day by day
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    child: Ink(
                      height: 100,
                      color: Colors.amber[colors[index % 2]],
                      child: Center(
                        child: Text("Workout ${entries[index]}"),
                      ),
                    ),
                    onTap: () {
                      print("touched ${index}");
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        tooltip: 'Add today\'s workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AddPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
