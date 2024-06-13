import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                child: const Text("Themes"),
              ),
              const Gap(10),
              const Divider(
                thickness: 1,
                indent: 90,
                endIndent: 90,
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () => "",
                child: const Text("Languages"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
