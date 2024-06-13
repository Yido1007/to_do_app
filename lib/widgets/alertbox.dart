import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/widgets/button.dart';

class AlertBox extends StatefulWidget {
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
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          TextField(
            controller: widget.controller,
          ),
          const Gap(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                text: 'Save',
                icon: (Icons.attach_file),
                onPressed: widget.save,
              ),
              const Gap(25),
              MyButton(
                text: 'Cancel',
                icon: (Icons.cancel_outlined),
                onPressed: widget.delete,
              ),
            ],
          )
        ],
      ),
    );
  }
}
