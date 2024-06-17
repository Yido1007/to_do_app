import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/bloc/client_cubit.dart';
import 'package:to_do_app/core/localizations.dart';
import 'package:to_do_app/widgets/button.dart';

class AlertBox extends StatefulWidget {
  final VoidCallback save;
  final VoidCallback delete;
  final TextEditingController bodyController;
  final TextEditingController titleController;

  const AlertBox({
    super.key,
    required this.save,
    required this.delete,
    required this.bodyController,
    required this.titleController,
  });

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: widget.titleController,
            ),
            const Gap(15),
            TextField(
              controller: widget.bodyController,
            ),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  text: AppLocalizations.of(context).getTranslate("save"),
                  icon: (Icons.attach_file),
                  onPressed: widget.save,
                ),
                const Gap(25),
                MyButton(
                  text: AppLocalizations.of(context).getTranslate('cancel'),
                  icon: (Icons.cancel_outlined),
                  onPressed: widget.delete,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
