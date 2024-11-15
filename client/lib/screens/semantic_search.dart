import 'package:client/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/product.dart';
import '../widgets/search/product_list.dart';
import '../widgets/shared_app_bar.dart';
import '../widgets/shared_bottom_navbar.dart';

class SemanticSearchScreen extends ConsumerWidget {
  const SemanticSearchScreen({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Product>> products =
        ref.watch(searchProductProvider(productName));
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const SharedAppBar(),
      bottomNavigationBar: const SharedBottomNavbar(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Wyszukiwarka przedmiotów i jak je recyklingować",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Wyszukaj przedmiot",
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10)),
                    IconButton.filled(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        final searchValue = searchController.text;
                        if (searchValue.isNotEmpty) {
                          context.go("/search/$searchValue");
                        } else {
                          context.go("/search");
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              switch (products) {
                AsyncData(:final value) => ProductList(products: value),
                AsyncError(:final error) => Text(error.toString()),
                _ => const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  )),
              },
            ],
          )),
    );
  }
}
