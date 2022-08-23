import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_tracker/models/workout.dart';
import 'package:intl/intl.dart';

class WorkoutList extends StatefulWidget {
  final List<Workout> entries;
  const WorkoutList({Key? key, required this.entries}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.entries.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => print('hi'),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.entries[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(widget.entries[index].date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
