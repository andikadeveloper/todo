import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/task_controller.dart';
import 'package:todo/app/data/models/task_model.dart';
import 'package:todo/app/routes/app_pages.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.task,
    required this.taskIndex,
  }) : super(key: key);

  final Task task;
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    var taskController = Get.find<TaskController>();

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red[200],
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (_) {
        bool isDelete = false;

        return Get.defaultDialog(
          radius: 5,
          title: 'WARNING',
          titleStyle:
              Get.theme.textTheme.headline6!.copyWith(color: Colors.red),
          middleText: 'Are you sure want to delete this task?',
          middleTextStyle: Get.theme.textTheme.bodyText1,
          cancel: OutlinedButton(
            onPressed: () {
              isDelete = false;
              Get.back();
            },
            child: Text('Cancel'),
          ),
          confirm: ElevatedButton(
            onPressed: () {
              isDelete = true;
              Get.back();
            },
            child: Text('Delete'),
          ),
        ).then(
          (_) {
            return isDelete;
          },
        );
      },
      onDismissed: (_) {
        taskController.deleteTask(task.id!, taskIndex);
      },
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              taskController.taskStatus(taskIndex, value!);
            },
          ),
          onLongPress: () {
            Get.toNamed(Routes.EDIT, arguments: {
              'taskIndex': taskIndex,
              'task': task,
            });
          },
          title: Text(
            task.taskName!,
            maxLines: 2,
            style: Get.theme.textTheme.bodyText1!.copyWith(
              decoration: task.isDone!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: task.isDone! ? Colors.red : Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
