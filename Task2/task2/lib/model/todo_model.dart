class TodoModel {
  final String title;
  final String  date;
  final String tasknumber;

  TodoModel({required this.title, required this.date, required this.tasknumber});



Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'tasknumber': tasknumber,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      date: json['date'],
      tasknumber: json['tasknumber'],
    );
  }
}