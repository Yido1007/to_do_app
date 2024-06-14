import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/bloc/client_cubit.dart';
import 'package:to_do_app/core/localizations.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return Drawer(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 5,
                    blurRadius: 100,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/to-do.png",
                width: 120,
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => GoRouter.of(context).push("/themes"),
                  child: Text(AppLocalizations.of(context).getTranslate("theme")),
                ),
                const Gap(10),
                const Divider(
                  thickness: 1,
                  indent: 90,
                  endIndent: 90,
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () => GoRouter.of(context).push("/language"),
                  child: Text(AppLocalizations.of(context).getTranslate("language")),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
