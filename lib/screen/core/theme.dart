import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/localizations.dart';

import '../../bloc/client_cubit.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool isDarkMode =
      ThemeMode.system == ThemeMode.light ? false : true; // Varsayılan olarak koyu moda başlayalım
  late SharedPreferences prefs; // SharedPreferences nesnesi
  late final ClientCubit clientCubit;

  @override
  void initState() {
    clientCubit = context.read<ClientCubit>();
    super.initState();

    _loadSelectedMode();
  }

  // Kayıtlı mod bilgisini yükleyen fonksiyon
  _loadSelectedMode() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = clientCubit.state.darkMode; // Kayıtlı mod bilgisini yükle, yoksa false kullan
    });
  }

  // Seçilen mod bilgisini kaydeden fonksiyon
  _saveSelectedMode(bool darkMode) async {
    await prefs.setBool('darkMode', darkMode); // Seçilen dil bilgisini kaydet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "appearance",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      themeModeItem(
                        context,
                        AppLocalizations.of(context).getTranslate("light"),
                        !isDarkMode, // Ters çevirdik
                        () {
                          setState(() {
                            isDarkMode = false;
                            _saveSelectedMode(false);
                            context.read<ClientCubit>().changeDarkMode(darkMode: false);
                          });
                        },
                        "assets/images/light.jpg",
                      ),
                      themeModeItem(
                        context,
                        AppLocalizations.of(context).getTranslate("dark"),
                        isDarkMode, // Değişiklik yok
                        () {
                          setState(() {
                            isDarkMode = true; // Koyu moda geçiş
                            _saveSelectedMode(true);
                            clientCubit.changeDarkMode(darkMode: true);
                          });
                        },
                        "assets/images/dark.jpg",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget themeModeItem(BuildContext context, String title, bool isChecked,
      void Function()? onChanged, String image) {
    return GestureDetector(
      onTap: onChanged,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 250,
            width: 125,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(5),
          Text(title),
          const Gap(5),
          Checkbox(
            value: isChecked,
            onChanged: onChanged != null ? (bool? value) => onChanged() : null,
          ),
        ],
      ),
    );
  }
}
