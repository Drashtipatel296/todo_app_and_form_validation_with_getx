import 'package:get/get.dart';
import '../model/data_model.dart';

class TodoController extends GetxController {
  var tasksList = <Task>[].obs;

  void addTask(String name) {
    tasksList.add(Task(name: name));
  }

  void toggleTask(int index) {
    tasksList[index].completed = !tasksList[index].completed;
    tasksList.refresh();
  }

  void updateTask(int index, String newName) {
    tasksList[index].name = newName;
    tasksList.refresh();
  }

  void removeFromList(int index) {
    tasksList.removeAt(index);
  }
}