import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SwitchListTile(
                title: const Text('Receive Notifications'),
                value: true, // Change this value based on user preference
                onChanged: (value) {
                  // Implement logic to toggle notifications
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  // Implement logic to change language
                },
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () {
                  // Implement logic to change language
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Theme',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('Light Mode'),
                onTap: () {
                  // Implement logic to change theme to light mode
                },
              ),
              ListTile(
                title: const Text('Dark Mode'),
                onTap: () {
                  // Implement logic to change theme to dark mode
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Font Size',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('Small'),
                onTap: () {
                  // Implement logic to change font size to small
                },
              ),
              ListTile(
                title: const Text('Medium'),
                onTap: () {
                  // Implement logic to change font size to medium
                },
              ),
              ListTile(
                title: const Text('Large'),
                onTap: () {
                  // Implement logic to change font size to large
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: const Text('Send Feedback'),
                onTap: () {
                  // Implement logic to navigate to feedback page
                },
              ),
              // Add more settings options as needed
            ],
          ),
        ),
      ),
    );
  }
}
