import 'package:flutter/material.dart';

class PostJobModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Post a New Job',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add your form fields here
            TextField(
              decoration: InputDecoration(labelText: 'Job Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Job Description'),
              maxLines: 4,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle job posting logic
              },
              child: Text('Post Job'),
            ),
          ],
        ),
      ),
    );
  }
}