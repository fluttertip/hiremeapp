import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the App! This is the Onboarding Screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}