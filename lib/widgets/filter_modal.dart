import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter Jobs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add filter options here
            // For example: Dropdowns, Checkboxes, etc.
            ElevatedButton(
              onPressed: () {
                // Apply filters
                Navigator.of(context).pop();
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}