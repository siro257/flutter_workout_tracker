import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewWorkout extends StatefulWidget {
  final Function addWorkout;
  const NewWorkout({Key? key, required this.addWorkout}) : super(key: key);

  @override
  State<NewWorkout> createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  final titleController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredSets = int.parse(setsController.text);
    final enteredReps = int.parse(repsController.text);

    if (enteredTitle.isEmpty || enteredSets <= 0 || enteredReps <= 0) {
      return;
    }

    widget.addWorkout(enteredTitle, enteredReps, enteredSets);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Workout"),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Reps"),
                    controller: repsController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Sets"),
                    controller: setsController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                )
              ],
            ),
            TextButton(onPressed: _submitData, child: Text("Add Workout"))
          ],
        ),
      ),
    );
  }
}
