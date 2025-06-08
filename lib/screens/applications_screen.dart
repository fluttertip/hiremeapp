import 'package:flutter/material.dart';

class ApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: Center(
        child: Text('List of job applications will be displayed here.'),
      ),
    );
  }
}