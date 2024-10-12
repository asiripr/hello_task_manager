class Task {
  String title;
  String description;
  bool isCompleted;
  String category;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.category = 'General',
  });

}