import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Image.asset("assets/images/to-do-list.jpg"),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => "",
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
