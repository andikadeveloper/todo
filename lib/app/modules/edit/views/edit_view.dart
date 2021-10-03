import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/app/controllers/task_controller.dart';
import 'package:todo/app/data/models/task_model.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    var taskController = Get.find<TaskController>();

    Task task = Get.arguments['task'];

    controller.taskNameController.text = task.taskName!;
    controller.date.value = task.taskDate!;
    controller.taskType.value = task.taskType!;

    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Edit task'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                taskController.editTask(
                  Get.arguments['taskIndex'],
                  name: controller.taskNameController.text,
                  date: controller.date.value,
                  taskType: controller.taskType.value,
                );
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Task',
                  style: Get.theme.textTheme.headline6,
                ),
              ),
              Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: controller.taskNameController,
                        autofocus: true,
                        style: Get.theme.textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: 'Add task...',
                          hintStyle: Get.theme.textTheme.bodyText1!
                              .copyWith(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: [
                          RadioListTile(
                            title: Text(
                              'Personal',
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            value: TaskType.personal,
                            groupValue: controller.taskType.value,
                            onChanged: (value) {
                              controller.taskType.value = value as TaskType;
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'Work',
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            value: TaskType.work,
                            groupValue: controller.taskType.value,
                            onChanged: (value) {
                              controller.taskType.value = value as TaskType;
                            },
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Obx(
                          () => Text(
                            DateFormat.MMMMd().format(controller.date.value),
                            style: Get.theme.textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: MaterialButton(
                  elevation: 10,
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      controller.date.value = date;
                    }
                  },
                  color: Colors.white,
                  minWidth: Get.width,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Select date',
                    style: Get.theme.textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
