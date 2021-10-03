import 'package:get/get.dart';

import 'package:todo/app/modules/add_task/bindings/add_task_binding.dart';
import 'package:todo/app/modules/add_task/views/add_task_view.dart';
import 'package:todo/app/modules/edit/bindings/edit_binding.dart';
import 'package:todo/app/modules/edit/views/edit_view.dart';
import 'package:todo/app/modules/home/bindings/home_binding.dart';
import 'package:todo/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => EditView(),
      binding: EditBinding(),
    ),
  ];
}
