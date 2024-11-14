import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SharedBottomNavbar extends StatefulWidget {
  const SharedBottomNavbar({super.key});

  @override
  State<SharedBottomNavbar> createState() => _SharedBottomNavbarState();
}

class _SharedBottomNavbarState extends State<SharedBottomNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
            icon: Icon(Icons.recycling), label: "Informacje o recyklingu"),
        NavigationDestination(
            icon: Icon(Icons.search), label: "Wyszukiwarka przedmiotów"),
        NavigationDestination(
            icon: Icon(Icons.assistant), label: "Asystent recyklingowy"),
      ],
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });

        switch (index) {
          case 0:
            context.go("/");
            break;
          case 1:
            context.go("/search");
            break;
        }
      },
      indicatorColor: Colors.lightBlue[200],
      selectedIndex: currentPageIndex,
    );
  }
}
