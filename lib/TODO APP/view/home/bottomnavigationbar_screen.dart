import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/todo_controller.dart';
import 'home_page.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.grey.shade50),);

    void showAddTaskDialog(BuildContext context) {
      String newTask = '';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Task'),
            content: TextField(
              onChanged: (value) {
                newTask = value;
              },
              decoration: const InputDecoration(
                  hintText: 'Enter task details'
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (newTask.isNotEmpty) {
                    todoController.addTask(newTask);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: CurvedNavBar(
        actionButton: CurvedActionBar(
          activeIcon: GestureDetector(
            onTap: () {
              showAddTaskDialog(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xff8CA8FE), shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        appBarItems: [
          FABBottomAppBarItem(
            activeIcon: const Icon(Icons.home),
            text: 'Home',
            inActiveIcon: const Icon(Icons.home),
          ),
          FABBottomAppBarItem(
            activeIcon: const Icon(Icons.calendar_month,color: Colors.grey,),
            text: 'Calender',
            inActiveIcon: const Icon(Icons.calendar_month,color: Colors.grey,),
          ),
          FABBottomAppBarItem(
            activeIcon: const Icon(Icons.note_alt_sharp,color: Colors.grey,),
            text: 'Notes',
            inActiveIcon: const Icon(Icons.note_alt_sharp,color: Colors.grey,),
          ),
          FABBottomAppBarItem(
            activeIcon: const Icon(Icons.settings),
            text: 'Settings',
            inActiveIcon: const Icon(Icons.settings,color: Colors.grey,),
          ),
        ],
        bodyItems: const [
          HomePage(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
        ],
      ),
    );
  }
}
