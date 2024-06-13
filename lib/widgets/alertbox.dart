import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/widgets/button.dart';

class AlertBox extends StatelessWidget {
  final VoidCallback save;
  final VoidCallback delete;
  final TextEditingController controller;

  const AlertBox({
    super.key,
    required this.save,
    required this.delete,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                text: 'Save',
                icon: (Icons.attach_file),
                onPressed: save,
              ),
              const Gap(5),
              MyButton(
                text: 'Delete',
                icon: (Icons.delete),
                onPressed: delete,
              ),
            ],
          )
        ],
      ),
    );
  }
}
