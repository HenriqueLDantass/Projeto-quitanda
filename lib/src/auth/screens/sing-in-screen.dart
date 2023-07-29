import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/criador.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';
import 'package:quitanda/src/auth/components/divisor_custom.dart';
import 'package:quitanda/src/auth/components/header_login.dart';
import 'package:quitanda/src/auth/screens/sing-up-screen.dart';
import 'package:quitanda/src/base/base_scrren.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Expanded(
                child: HeaderLogin(),
              ),

//formulario
              Container(
                padding: const EdgeInsets.symmetric(
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
//button de entrar
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (c) => const BaseScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    //esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const DivisorCustom(),
//Button de criar conta
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(width: 2, color: Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SingUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Criar conta",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Criador()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
