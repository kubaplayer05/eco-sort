import 'package:client/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Color? color = Colors.grey[50];
    Color? textColor = Colors.black;

    switch (product.categoryId) {
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
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategoria: ${product.categoryName}",
              style: TextStyle(color: textColor),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            if (product.description != null)
              Text("Jak segregować: ${product.description}",
                  style: TextStyle(color: textColor))
          ],
        ),
      ),
    );
  }
}
