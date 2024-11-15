import 'package:client/models/suggestion.dart';
import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key, required this.suggestion});

  final Suggestion suggestion;

  @override
  Widget build(BuildContext context) {
    Color? color = Colors.grey[50];
    Color? textColor = Colors.black;

    switch (suggestion.categoryId) {
      case 1:
        color = Colors.amber[100];
        break;
      case 2:
        color = Colors.lightGreen[100];
        break;
      case 3:
        color = Colors.brown[200];
        break;
      case 4:
        color = Colors.lightBlue[100];
        break;
      case 5:
        color = Colors.grey[200];
        break;
      case 6:
        color = Colors.blue[700];
        textColor = Colors.white;
        break;
      case 7:
        color = Colors.red[700];
        textColor = Colors.white;
        break;
      case 8:
        color = Colors.purple[100];
        break;
      case 9:
        color = Colors.black12;
        textColor = Colors.white;
        break;
    }

    return Card(
      color: color,
      child: ListTile(
        textColor: textColor,
        title: Text(suggestion.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jak segregować: ${suggestion.description}",
                style: TextStyle(color: textColor))
          ],
        ),
      ),
    );
  }
}
