import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, //para ficar mais largo
                children: [
                  const CustomTextField(
                    icon: Icons.email,
                    labelText: 'Email',
                  ),
                  const CustomTextField(
                    icon: Icons.lock,
                    labelText: "Senha",
                    isSecret: true,
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {},
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
