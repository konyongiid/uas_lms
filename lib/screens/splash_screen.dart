import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 241, 248),
      body: Center(
        child: Text(
          'Learnify',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C7DA0),
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
