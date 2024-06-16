import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:to_do_app/bloc/client_cubit.dart';
import 'package:to_do_app/core/localizations.dart';
import 'package:to_do_app/screen/client/home.dart';

import 'package:to_do_app/screen/client/languages.dart';
import 'package:to_do_app/screen/core/theme.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late ClientCubit clientCubit;
  final mySelectedStyle = const TextStyle(fontSize: 22);

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return HiddenDrawerMenu(
        screens: [
          ScreenHiddenDrawer(
            ItemHiddenMenu(
              name: AppLocalizations.of(context).getTranslate("theme"),
              baseStyle:
                  TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.inverseSurface),
              selectedStyle: mySelectedStyle,
              colorLineSelected: Theme.of(context).colorScheme.inverseSurface,
            ),
            const ThemeScreen(),
          ),
          ScreenHiddenDrawer(
            ItemHiddenMenu(
              name: "To Do",
              baseStyle: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              selectedStyle: mySelectedStyle,
              colorLineSelected: Theme.of(context).colorScheme.inverseSurface,
            ),
            const HomeScreen(),
          ),
          ScreenHiddenDrawer(
            ItemHiddenMenu(
              name: AppLocalizations.of(context).getTranslate("language"),
              baseStyle:
                  TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.inverseSurface),
              selectedStyle: mySelectedStyle,
              colorLineSelected: Theme.of(context).colorScheme.inverseSurface,
            ),
            const LanguageScreen(),
          ),
        ],
        backgroundColorMenu: Theme.of(context).colorScheme.surface,
        initPositionSelected: 1,
        slidePercent: 40,
        contentCornerRadius: 20,
      );
    });
  }
}
