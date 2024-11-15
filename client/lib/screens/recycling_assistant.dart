import 'package:client/models/suggestion.dart';
import 'package:client/widgets/shared_app_bar.dart';
import 'package:client/widgets/shared_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/suggestion.dart';
import '../widgets/suggestion_list.dart';

class RecyclingAssistantScreen extends ConsumerWidget {
  const RecyclingAssistantScreen({super.key, this.productName});

  final String? productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Suggestion>>? suggestions;
    if (productName != null) {
      suggestions = ref.watch(getSuggestionsProvider(productName!));
    }
    final TextEditingController productController = TextEditingController();

    return Scaffold(
      appBar: const SharedAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Wprowadź nazwę produktu, aby dowiedzieć się, jak go segregować",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: productController,
                      decoration: const InputDecoration(
                        hintText: "Wyszukaj przedmiot",
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  IconButton.filled(
                      onPressed: () {
                        final searchValue = productController.text;
                        if (searchValue.isNotEmpty) {
                          context.go("/recycling-assistant/$searchValue");
                        } else {
                          context.go("/recycling-assistant");
                        }
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
              if (suggestions != null) ...[
                const Padding(padding: EdgeInsets.only(top: 20)),
                switch (suggestions) {
                  AsyncData(:final value) => SuggestionList(suggestions: value),
                  AsyncError(:final error) => Text(error.toString()),
                  _ => const CircularProgressIndicator(),
                },
              ],
            ],
          )),
      bottomNavigationBar: const SharedBottomNavbar(),
    );
  }
}