import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 2)
enum TaskType {
  @HiveField(0)
  personal,

  @HiveField(1)
  work,
}

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? taskName;

  @HiveField(2)
  DateTime? taskDate;

  @HiveField(3)
  TaskType? taskType;

  @HiveField(4)
  bool? isDone;

  Task(
      {this.id,
      this.taskName,
      this.taskDate,
      this.taskType,
      this.isDone = false});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    taskDate = json['taskDate'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['task_name'] = taskName;
    data['taskDate'] = taskDate;
    data['isDone'] = isDone;
    return data;
  }
}
