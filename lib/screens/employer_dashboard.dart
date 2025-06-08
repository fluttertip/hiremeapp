import 'package:flutter/material.dart';

class EmployerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employer Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to the Employer Dashboard!'),
      ),
    );
  }
}