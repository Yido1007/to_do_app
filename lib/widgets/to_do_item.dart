import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final String tasktitle;
  final bool taskCompleted;
  final Function(BuildContext)? deleteFunc;
  final Function(bool?)? onChanged;

  const ToDoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    this.deleteFunc,
    required this.tasktitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, right: 14, left: 14),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(2),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(14)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    tasktitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: taskCompleted,
                      // activeColor: Theme.of(context).colorScheme.error,
                      onChanged: onChanged,
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                          decoration:
                              taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
