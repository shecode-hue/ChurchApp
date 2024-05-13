import 'package:flutter/material.dart';

// HomePage class, which is a StatelessWidget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Returning a Scaffold widget
    return Scaffold(
      // Body of the Scaffold, consisting of a SingleChildScrollView containing a Column
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Displaying an image
            Image.asset(
              'images/logo.jpeg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Adding some vertical space
            // Displaying a text widget with a welcome message
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome Secretary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20), // Adding some vertical space
            // Button to navigate to administrative tasks page
            ElevatedButton(
              onPressed: () {
                // Implement action to navigate to administrative tasks page
              },
              child: const Text('Manage Church Activities'),
            ),
            const SizedBox(height: 20), // Adding some vertical space
            // Button to navigate to member communications page
            ElevatedButton(
              onPressed: () {
                // Implement action to navigate to member communications page
              },
              child: const Text('Send Communication to Members'),
            ),
            const SizedBox(height: 20), // Adding some vertical space
            // Button to navigate to financial management page
            ElevatedButton(
              onPressed: () {
                // Implement action to navigate to financial management page
              },
              child: const Text('Manage Finances'),
            ),
            const SizedBox(height: 20), // Adding some vertical space
            // Button to navigate to events planning page
            ElevatedButton(
              onPressed: () {
                // Implement action to navigate to events planning page
              },
              child: const Text('Plan Events'),
            ),
          ],
        ),
      ),
    );
  }
}
