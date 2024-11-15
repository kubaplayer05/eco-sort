import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.energy_savings_leaf_outlined),
      title: GestureDetector(
        onTap: () {
          context.go("/");
        },
        child: const Text(
          "Eco sort",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
