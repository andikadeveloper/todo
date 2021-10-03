import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoDrawer extends StatefulWidget {
  const TodoDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoDrawer> createState() => _TodoDrawerState();
}

class _TodoDrawerState extends State<TodoDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.3,
                width: constraints.maxWidth,
                child: Image.asset(
                  'assets/images/image-1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              _drawerItem(
                  icon: Icons.all_inbox,
                  text: 'All task',
                  onTap: () {
                    Get.back();
                  }),
              _drawerItem(
                icon: Icons.today,
                text: 'Today',
                onTap: () {
                  Get.back();
                },
              ),
              _drawerItem(
                icon: Icons.next_week,
                text: 'Tomorrow',
                onTap: () {
                  Get.back();
                },
              ),
              _drawerItem(
                  icon: Icons.personal_video,
                  text: 'Personal',
                  onTap: () {
                    Get.back();
                  }),
              _drawerItem(
                  icon: Icons.work,
                  text: 'Work',
                  onTap: () {
                    Get.back();
                  }),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Create by Andika',
                  style: Get.theme.textTheme.bodyText1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ListTile _drawerItem({
    required IconData icon,
    required String text,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: Get.theme.textTheme.bodyText1,
      ),
      onTap: onTap,
    );
  }
}
