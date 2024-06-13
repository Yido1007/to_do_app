import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/database.dart';
import '../../widgets/alertbox.dart';
import '../../widgets/to_do_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box _storage;
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _initializeHive() async {
    _storage = Hive.box("storage");
    if (_storage.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }
    setState(() {}); // Refresh the state after Hive initialization
  }

  final _controller = TextEditingController();

  // Control Checkbox tap
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: AlertBox(
            controller: _controller,
            save: saveNewTask,
            delete: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      // ignore: unnecessary_null_comparison
      body: _storage == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunc: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
