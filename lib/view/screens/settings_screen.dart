import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.cyan),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.teal),
              title: const Text('Account Settings'),
              onTap: () {
                // Handle account settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.blue),
              title: const Text('Language'),
              onTap: () {
                // Handle language settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.orange),
              title: const Text('Theme'),
              onTap: () {
                // Handle theme settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.green),
              title: const Text('Notifications'),
              onTap: () {
                // Handle notifications settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security, color: Colors.red),
              title: const Text('Privacy & Security'),
              onTap: () {
                // Handle privacy & security settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.yellow),
              title: const Text('Help & Support'),
              onTap: () {
                // Handle help & support settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.purple),
              title: const Text('App Information'),
              onTap: () {
                // Handle app information
              },
            ),
            // Add more settings options here as needed
          ],
        ),
      ),
    );
  }
}
