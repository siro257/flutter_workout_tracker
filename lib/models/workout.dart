class Workout {
  final String id;
  final String title;
  final int reps;
  final int sets;
  final DateTime date;

  Workout(
      {required this.id,
      required this.title,
      required this.reps,
      required this.sets,
      required this.date});
}
