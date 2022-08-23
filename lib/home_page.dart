import 'package:flutter/material.dart';
import 'package:flutter_workout_tracker/constants.dart';
import 'package:flutter_workout_tracker/models/workout.dart';
import 'package:flutter_workout_tracker/widgets/new_workout.dart';
import 'package:flutter_workout_tracker/widgets/workout_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>["Day 1", "Day 2", "Day 3"];
  final List<Workout> workouts = [
    Workout(
        id: "w1",
        title: "Incline Dumbbell Bench",
        reps: 4,
        sets: 12,
        date: DateTime.now()),
    Workout(
        id: "w2",
        title: "Side dumbell latteral raise",
        reps: 4,
        sets: 12,
        date: DateTime.now()),
    Workout(
        id: "w3",
        title: "Dumbbell row",
        reps: 4,
        sets: 12,
        date: DateTime.now()),
  ];

  void _addNewWorkout(String workoutTitle, int reps, int sets) {
    final newWorkout = Workout(
        id: DateTime.now().toString(),
        title: workoutTitle,
        reps: reps,
        sets: sets,
        date: DateTime.now());

    setState(() {
      workouts.add(newWorkout);
    });
  }

  void _startAddNewWorkout(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewWorkout(addWorkout: _addNewWorkout),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amberAccent,
              child: Text("dis graph"),
            ),
          ),
          Expanded(
            child: WorkoutList(
              entries: workouts,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewWorkout(context),
        tooltip: 'Add today\'s workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
