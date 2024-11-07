import 'package:flutter/material.dart';

class RecycleCategoryCard extends StatelessWidget {
  const RecycleCategoryCard(
      {required this.title, this.backgroundColor, this.textColor, super.key});

  final Color? backgroundColor;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      ),
    );
  }
}
