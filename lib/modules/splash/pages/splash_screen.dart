import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.green.shade200,
              Colors.green.shade400,
              Colors.green.shade600,
            ])),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quitanda",
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                Text(
                  "Online",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
