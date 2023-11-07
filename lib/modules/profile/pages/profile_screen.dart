import 'package:flutter/material.dart';
import 'package:quitanda/core/shared/widgets/custom_text_field.dart';
import 'package:quitanda/modules/home/mocks/home_item_data.dart' as appData;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil usuario"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        children: [
          CustomTextField(
            icon: Icons.email,
            labelText: "Email",
            initialValue: appData.user.email,
            readOnly: true,
          ),
          CustomTextField(
            icon: Icons.person,
            labelText: "Nome",
            initialValue: appData.user.name,
            readOnly: true,
          ),
          CustomTextField(
            icon: Icons.phone,
            labelText: "Celular",
            initialValue: appData.user.celular,
            readOnly: true,
          ),
          CustomTextField(
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            labelText: "CPF",
            isSecret: true,
            readOnly: true,
          ),
          //alterar senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: updateSenha,
                child: const Text("atualizar senha")),
          )
        ],
      ),
    );
  }

  Future<bool?> updateSenha() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Atualizar senha",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    labelText: "Senha atual",
                    initialValue: appData.user.celular,
                    isSecret: true,
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    labelText: "Nova senha",
                    initialValue: appData.user.celular,
                    isSecret: true,
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    labelText: "Confirme nova senha",
                    initialValue: appData.user.celular,
                    isSecret: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Atualizar")),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
