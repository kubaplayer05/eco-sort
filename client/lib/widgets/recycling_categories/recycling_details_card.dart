import 'package:flutter/material.dart';

class RecyclingDetailsCard extends StatelessWidget {
  const RecyclingDetailsCard(
      {super.key,
      required this.title,
      required this.items,
      this.backgroundColor,
      required this.icon});

  final String title;
  final Color? backgroundColor;
  final IconData icon;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
              for (var item in items)
                Text("- $item", style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
