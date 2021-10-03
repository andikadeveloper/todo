import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/data/models/task_model.dart';

class TaskController extends GetxController {
  var tasks = [].obs;

  late Box taskBox;

  addTask(
      {required String name,
      required TaskType taskType,
      required DateTime date}) {
    String id = DateTime.now().toString();

    Task task = Task(
      id: id,
      taskName: name,
      taskType: taskType,
      taskDate: date,
    );

    taskBox.add(task).then(
      (_) {
        fetchTask();
        Get.back();
      },
    );
  }

  taskStatus(int index, bool value) {
    Task task = taskBox.getAt(index);
    task.isDone = value;

    taskBox.putAt(index, task);

    fetchTask();
  }

  editTask(int index,
      {required String name,
      required DateTime date,
      required TaskType taskType}) {
    Task task = taskBox.getAt(index);
    task.taskName = name;
    task.taskDate = date;
    task.taskType = taskType;

    taskBox.putAt(index, task);
    fetchTask();

    Get.back();
  }

  deleteTask(String id, int taskIndex) {
    taskBox.deleteAt(taskIndex).then((_) {
      fetchTask();
    });
  }

  fetchTask() {
    tasks.value = [...taskBox.values];
  }

  @override
  void onInit() {
    super.onInit();
    taskBox = Hive.box('taskBox');
    fetchTask();
  }
}
