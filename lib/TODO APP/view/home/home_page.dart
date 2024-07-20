import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/todo_controller.dart';
import '../../utils/categories_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning 👋',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                'Drashti Patel',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
          leading: const Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/bg2.jpeg'),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: categoriesBox(
                        categoriesList[index]['name'],
                        categoriesList[index]['icon'],
                        categoriesList[index]['color'],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Today's Tasks",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 360,
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: todoController.tasksList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          child: ListTile(
                            leading: Checkbox(
                              onChanged: (value) {
                                todoController.toggleTask(index);
                              },
                              value: todoController.tasksList[index].completed,
                              activeColor: const Color(0xff8CA8FE),
                            ),
                            title: Text(
                              todoController.tasksList[index].name,
                              style: GoogleFonts.poppins(
                                  decoration: todoController.tasksList[index].completed
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _showUpdateDialog(
                                        context, todoController, index);
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 19,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    todoController.removeFromList(index);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.delete_solid,
                                    size: 19,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUpdateDialog(
      BuildContext context, TodoController todoController, int index) {
    TextEditingController taskController =
        TextEditingController(text: todoController.tasksList[index].name);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Enter new task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                todoController.updateTask(index, taskController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Column categoriesBox(String name, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }
}
