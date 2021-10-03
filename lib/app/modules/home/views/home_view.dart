import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/controllers/task_controller.dart';
import 'package:todo/app/data/models/task_model.dart';
import 'package:todo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'widgets/todo_drawer.dart';
import 'widgets/todo_item.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var taskController = Get.find<TaskController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TodoDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: Get.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/image-1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                'All Task',
                style: Get.theme.textTheme.headline6,
              ),
            ),
          ),
          Obx(
            () => SliverToBoxAdapter(
              child: (taskController.tasks.isEmpty)
                  ? Container(
                      width: Get.width,
                      height: Get.height * 0.8,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * 0.2,
                            child: Image.asset('assets/images/no-task.png'),
                          ),
                          Text(
                            'You have no task',
                            style: Get.theme.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: List.generate(
                          taskController.tasks.length,
                          (index) {
                            Task task = taskController.tasks[index];

                            return TodoItem(
                              task: task,
                              taskIndex: index,
                            );
                          },
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_TASK);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
