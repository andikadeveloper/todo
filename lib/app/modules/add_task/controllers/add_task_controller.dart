import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/task_model.dart';

class AddTaskController extends GetxController {
  late TextEditingController taskNameController;
  var taskType = TaskType.personal.obs;
  var date = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();

    taskNameController = TextEditingController();
  }

  @override
  void onClose() {
    taskNameController.dispose();
  }
}
