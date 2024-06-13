import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/bloc/client_cubit.dart';
import 'core/localizations.dart';
import 'core/routes.dart';
import 'core/themes.dart';
// import 'screen/client/home.dart'; // Make sure to import your HomeScreen file here

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCubit(ClientState(language: "en", darkMode: false)),
      child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
        return MaterialApp.router(
          routerConfig: routes,
          debugShowCheckedModeBanner: false,
          themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
            Locale('es', 'ES'),
            Locale('de', 'DE'),
            Locale('fr', 'FR'),
            Locale("it", 'IT'),
          ],
          locale: Locale(state.language),
        );
      }),
    );
  }
}
