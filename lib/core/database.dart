import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _storage = Hive.box("storage");

  void createInitalData() {
    toDoList = [
      ["Make Tutorial", false, "Example"],
      ["Do Exercise", false, "Example"],
    ];
  }

  void loadData() {
    toDoList = _storage.get("TODOLIST");
  }

  void updateData() {
    _storage.put("TODOLIST", toDoList);
  }
}
