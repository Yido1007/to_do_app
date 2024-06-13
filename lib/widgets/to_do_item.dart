import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(BuildContext)? deleteFunc;
  final Function(bool?)? onChanged;

  const ToDoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    this.deleteFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
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
                    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
