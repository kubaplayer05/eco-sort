import 'package:flutter/material.dart';

class RecycleCategoryCard extends StatelessWidget {
  const RecycleCategoryCard(
      {required this.title,
      this.backgroundColor,
      this.textColor,
      super.key,
      required this.onTap});

  final Color? backgroundColor;
  final Color? textColor;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
      ),
    );
  }
}
