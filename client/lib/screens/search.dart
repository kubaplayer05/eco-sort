import 'package:client/models/product.dart';
import 'package:client/providers/product.dart';
import 'package:client/widgets/search/product_list.dart';
import 'package:client/widgets/shared_app_bar.dart';
import 'package:client/widgets/shared_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Product>> products = ref.watch(getProductsProvider);

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
              const Padding(padding: EdgeInsets.only(top: 20)),
              switch (products) {
                AsyncData(:final value) => ProductList(products: value),
                AsyncError(:final error) => Text(error.toString()),
                _ => const CircularProgressIndicator(),
              },
            ],
          )),
    );
  }
}
