import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title, required this.des});

  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 0),
            blurRadius: 10)
      ],
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.only( right: 16, left: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(des,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
