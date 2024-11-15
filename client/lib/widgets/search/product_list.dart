import 'package:client/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final Product product = products[index];
      
            return Card(
              color: Colors.lightBlue[100],
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(product.categoryName),
              ),
            );
          }),
    );
  }
}
