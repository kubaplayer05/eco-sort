import 'package:client/widgets/recycling_categories/recycling_details_card.dart';
import 'package:client/widgets/shared_app_bar.dart';
import 'package:flutter/material.dart';

class RecyclingCategory extends StatelessWidget {
  const RecyclingCategory(
      {super.key,
      required this.title,
      required this.description,
      this.allowedItems,
      this.disallowedItems,
      this.additionalInfo});

  final String title;
  final String description;
  final List<String>? allowedItems;
  final List<String>? disallowedItems;
  final List<String>? additionalInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            if (allowedItems != null)
              RecyclingDetailsCard(
                title: "Jakie przedmioty wyrzucać",
                icon: Icons.add_circle_outline,
                items: allowedItems!,
                backgroundColor: Colors.green[50],
              ),
            if (disallowedItems != null)
              RecyclingDetailsCard(
                title: "Jakie przedmioty nie wyrzucać",
                icon: Icons.remove_circle_outline,
                items: disallowedItems!,
                backgroundColor: Colors.red[50],
              ),
            if (additionalInfo != null)
              RecyclingDetailsCard(
                title: "Dodatkowe informacje",
                icon: Icons.info_outline,
                items: additionalInfo!,
                backgroundColor: Colors.blue[50],
              )
          ],
        ),
      ),
    );
  }
}
