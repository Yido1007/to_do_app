import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../widgets/button.dart';
import '../../widgets/to_do_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //list of tasks
  List toDoList = [
    ["deneme", false],
    ["deneme2", true]
  ];

  //Control Checkbox tap
  void checkBoxchanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(
              children: [
                const TextField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButton(
                      text: 'Save',
                      icon: (Icons.attach_file),
                      onPressed: () {},
                    ),
                    const Gap(5),
                    MyButton(
                      text: 'Delete',
                      icon: (Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
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
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoItem(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxchanged(value, index),
            );
          }),
    );
  }
}
