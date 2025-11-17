import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h1d023017_tugas7/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _biometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Settings
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Settings',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSettingItem(
                      'Change Password',
                      Icons.lock,
                      () {},
                    ),
                    _buildSettingItem(
                      'Privacy Settings',
                      Icons.privacy_tip,
                      () {},
                    ),
                    _buildSettingItem(
                      'Two-Factor Authentication',
                      Icons.security,
                      () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // App Settings
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Settings',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: Text(
                        'Push Notifications',
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Text(
                        'Receive app notifications',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      value: _notifications,
                      onChanged: (value) {
                        setState(() {
                          _notifications = value;
                        });
                      },
                      secondary: const Icon(Icons.notifications),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Dark Mode',
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Text(
                        'Use dark theme',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      value: _darkMode,
                      onChanged: (value) {
                        setState(() {
                          _darkMode = value;
                        });
                      },
                      secondary: const Icon(Icons.dark_mode),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Biometric Login',
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Text(
                        'Use fingerprint or face ID',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      value: _biometric,
                      onChanged: (value) {
                        setState(() {
                          _biometric = value;
                        });
                      },
                      secondary: const Icon(Icons.fingerprint),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Support
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSettingItem(
                      'Help Center',
                      Icons.help_center,
                      () {},
                    ),
                    _buildSettingItem(
                      'Contact Support',
                      Icons.support_agent,
                      () {},
                    ),
                    _buildSettingItem(
                      'About App',
                      Icons.info,
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: GoogleFonts.poppins()),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}