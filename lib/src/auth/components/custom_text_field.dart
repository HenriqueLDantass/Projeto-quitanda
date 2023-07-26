import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final bool isSecret;

  const CustomTextField(
      {super.key,
      required this.icon,
      required this.labelText,
      this.isSecret = false}); //falando que por padrao sera falso

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isSecret;
    //Se o meu isSecret esta passando o valor para o obscureText, se eu falar que e true o input ira aparecer com as bolinhas, caso ao contrario não ira aparecer nada
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
