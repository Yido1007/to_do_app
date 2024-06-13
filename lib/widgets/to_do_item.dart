import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const ToDoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 243, 191),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
