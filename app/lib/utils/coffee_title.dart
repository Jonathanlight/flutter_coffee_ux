import 'package:flutter/material.dart';

class CoffeeTitle extends StatelessWidget {
  final bool isSelected;
  final String coffeeType;
  final VoidCallback onTap;

  const CoffeeTitle(
      {required this.isSelected,
      required this.coffeeType,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
