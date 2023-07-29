import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/loja.png',
          color: Colors.white,
          width: 150,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quitanda",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Online",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 63, 242, 129))),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: const Text(
            "Bem-vindo(a) ao QuitandaOnline - Sua quitanda local agora ao alcance de um toque!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
