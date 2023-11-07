import 'package:flutter/material.dart';

class Criador extends StatelessWidget {
  const Criador({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("Criado por @Henrique dantas"),
      ],
    ));
  }
}
