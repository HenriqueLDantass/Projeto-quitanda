import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) results;
  final bool remover;
  const QuantityButton(
      {super.key,
      required this.value,
      required this.suffixText,
      required this.results,
      this.remover = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            color: !remover || value > 1 ? Colors.grey : Colors.red,
            icon: !remover || value > 1 ? Icons.remove : Icons.delete,
            onpressed: () {
              if (value == 1 && !remover) return;

              int resultCount = value - 1;
              results(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("$value $suffixText"),
          ),
          _QuantityButton(
            color: Colors.green,
            icon: Icons.add,
            onpressed: () {
              int resultCount = value + 1;
              results(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onpressed;
  const _QuantityButton({
    required this.icon,
    required this.color,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: onpressed,
        child: Ink(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(
              icon,
              size: 16,
              color: Colors.white,
            )),
      ),
    );
  }
}
