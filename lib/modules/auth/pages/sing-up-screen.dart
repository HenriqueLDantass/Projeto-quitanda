import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/core/shared/validators/validators.dart';
import 'package:quitanda/core/shared/widgets/custom_text_field.dart';
import 'package:quitanda/modules/auth/controller/auth_controller.dart';

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

  final _formkey = GlobalKey<FormState>();

  AuthControlller authControlller = Get.find<AuthControlller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            "assets/images/frutas.jpg",
            fit: BoxFit.cover,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 17, 107, 20),
                  size: 50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Text(
                  "Tela de cadastro",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 107, 20), fontSize: 30),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    icon: Icons.email,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                    onSaved: (value) => authControlller.user.email = value,
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    labelText: 'Senha',
                    isSecret: true,
                    validator: passwordValidator,
                    onSaved: (value) => authControlller.user.password = value,
                  ),
                  CustomTextField(
                    icon: Icons.person,
                    labelText: 'Nome',
                    validator: nameValidator,
                    onSaved: (value) => authControlller.user.name = value,
                  ),
                  CustomTextField(
                    icon: Icons.phone,
                    labelText: 'Tel',
                    inputFormatter: [telFormatter],
                    keyboardType: TextInputType.phone,
                    validator: phoneValidator,
                    onSaved: (value) => authControlller.user.phone = value,
                  ),
                  CustomTextField(
                    icon: Icons.file_copy,
                    labelText: 'CPF',
                    inputFormatter: [cpfFormatter],
                    keyboardType: TextInputType.number,
                    validator: cpfValidator,
                    onSaved: (value) => authControlller.user.cpf = value,
                  ),
                  SizedBox(
                    height: 52,
                    child: GetX<AuthControlller>(
                      builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                          ),
                          onPressed: authControlller.isLoading.value
                              ? null
                              : () {
                                  if (_formkey.currentState!.validate()) {
                                    //salvando/acionando os OnSave
                                    //Focus.of(context).unfocus();
                                    _formkey.currentState!.save();
                                    authControlller.signUp();
                                    print(authControlller.user);
                                  }
                                },
                          child: authControlller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Cadastrar usuário",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
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
