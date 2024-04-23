class Todo {
  final int id;
  final String title;
  final String? description;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isDone = false,
  });
}
