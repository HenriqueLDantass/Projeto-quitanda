import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onpressed});

  final String category;
  final bool isSelected;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: onpressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            category,
            style: TextStyle(
              fontSize: isSelected ? 18 : 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
