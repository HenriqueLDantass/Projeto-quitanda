import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final telFormatter = MaskTextInputFormatter(
    mask: "+## #######-####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/frutas.jpg",
                fit: BoxFit.cover,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 17, 107, 20),
                  size: 50,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(
                        icon: Icons.email,
                        labelText: 'Email',
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        labelText: 'Senha',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.person,
                        labelText: 'Nome',
                      ),
                      CustomTextField(
                        icon: Icons.phone,
                        labelText: 'Tel',
                        inputFormatter: [telFormatter],
                      ),
                      CustomTextField(
                        icon: Icons.file_copy,
                        labelText: 'CPF',
                        inputFormatter: [cpfFormatter],
                      ),
                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
