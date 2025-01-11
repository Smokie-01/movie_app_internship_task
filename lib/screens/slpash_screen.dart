import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'images/images.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
