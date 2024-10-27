class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id, 
    required this.text, 
    this.isCompleted = false // initial value
  });

  // Method toggle completion on & off
  Todo todoggleCompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted
    );
  }

}