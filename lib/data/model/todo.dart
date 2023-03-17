class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Todo copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Todo(
      id: id,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
    );
  }

  static List<Todo> getList() {
    return [
      Todo(id: "1", title: "Explore app localization"),
      Todo(id: "2", title: "Understand hot reload vs hot restart"),
      Todo(id: "3", title: "Study ThemeData and other flutter widgets"),
      Todo(id: "4", title: "Create an app", isCompleted: true),
      Todo(id: "5", title: "Complete the assignment"),
    ];
  }
}
