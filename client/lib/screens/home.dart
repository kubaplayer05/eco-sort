import 'package:client/widgets/home/recycle_category_card.dart';
import 'package:client/widgets/shared_app_bar.dart';
import 'package:client/widgets/shared_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(),
      bottomNavigationBar: const SharedBottomNavbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kategorie segregacji odpadów",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            RecycleCategoryCard(
              backgroundColor: Colors.lightBlue[100],
              title: "Papier",
              onTap: () {
                context.go("/recycling-categories/paper");
              },
            ),
            RecycleCategoryCard(
              backgroundColor: Colors.amber[100],
              title: "Plastik i Metal",
              onTap: () {
                context.go("/recycling-categories/plastic");
              },
            ),
            RecycleCategoryCard(
              backgroundColor: Colors.lightGreen[100],
              title: "Szkło",
              onTap: () {
                context.go("/recycling-categories/glass");
              },
            ),
            RecycleCategoryCard(
              backgroundColor: Colors.brown[200],
              title: "Bioodpady",
              onTap: () {
                context.go("/recycling-categories/bio");
              },
            ),
            RecycleCategoryCard(
              backgroundColor: Colors.grey[200],
              title: "Odpady zmieszane",
              onTap: () {
                context.go("/recycling-categories/mixed");
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text("Dodatkowe informacje",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            RecycleCategoryCard(
              backgroundColor: Colors.blue[700],
              textColor: Colors.white,
              title: "Elektronika i Baterie",
              onTap: () {},
            ),
            RecycleCategoryCard(
              backgroundColor: Colors.red[700],
              textColor: Colors.white,
              title: "Leki i Chemikalia",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
