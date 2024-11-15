import 'package:client/widgets/suggestion_card.dart';
import 'package:flutter/material.dart';

import '../models/suggestion.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({super.key, required this.suggestions});

  final List<Suggestion> suggestions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final Suggestion suggestion = suggestions[index];

            return SuggestionCard(suggestion: suggestion);
          }),
    );
  }
}
