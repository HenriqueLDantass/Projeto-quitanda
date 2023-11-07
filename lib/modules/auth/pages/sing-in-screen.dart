import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/core/routes/app_routes.dart';
import 'package:quitanda/modules/auth/controller/auth_controller.dart';
import 'package:quitanda/modules/auth/widgets/criador.dart';
import 'package:quitanda/core/shared/widgets/custom_text_field.dart';
import 'package:quitanda/modules/auth/widgets/divisor_custom.dart';
import 'package:quitanda/modules/auth/widgets/header_login.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({super.key});

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formkey,
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
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        labelText: 'Email',
                        validator: (email) {
                          if (email == null || !email.isEmail) {
                            return "Digite seu Email!";
                          } else if (!email.isEmail) {
                            return "Digite um Email valido!";
                          }

                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        labelText: "Senha",
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return "Digite uma senha!";
                          } else if (password.length < 7) {
                            return "Digite uma senha com pelo menos 7 caracteres";
                          }

                          return null;
                        },
                      ),
                      //button de entrar
                      SizedBox(
                        height: 45,
                        child: GetX<AuthControlller>(
                          builder: (authControlller) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authControlller.isLoading.value
                                  ? null
                                  : () {
                                      //tirar o foco dos input
                                      FocusScope.of(context).unfocus();
                                      //verificando se os campos esta ok
                                      if (_formkey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authControlller.signLoading(
                                            email: email, password: password);
                                        print(
                                            "Email: $email - Senha: $password");
                                      } else {
                                        print(
                                            "Os campos não estão preenchidos");
                                      }

                                      // Get.offNamed(NamedRoutes.baseRoute);
                                    },
                              child: authControlller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Entrar",
                                      style: TextStyle(fontSize: 18),
                                    ),
                            );
                          },
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
                            side:
                                const BorderSide(width: 2, color: Colors.green),
                          ),
                          onPressed: () {
                            Get.toNamed(NamedRoutes.sigUpRoute);
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
      ),
    );
  }
}
