import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h1d023017_tugas7/screens/dashboard_screen.dart';
import 'package:h1d023017_tugas7/screens/profile_screen.dart';
import 'package:h1d023017_tugas7/screens/settings_screen.dart';
import 'package:h1d023017_tugas7/utils/auth_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final AuthService _authService = AuthService();
  String? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = await _authService.getCurrentUser();
    setState(() {
      _currentUser = user;
    });
  }

  void _navigateTo(Widget screen) {
    Navigator.pop(context); // Close drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            UserAccountsDrawerHeader(
              accountName: Text(
                _currentUser?.split('@').first ?? 'User',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                _currentUser ?? 'user@example.com',
                style: GoogleFonts.poppins(),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _currentUser?.substring(0, 1).toUpperCase() ?? 'U',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ),
            ),

            // Menu Items
            _buildDrawerItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () => _navigateTo(const DashboardScreen()),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () => _navigateTo(const ProfileScreen()),
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () => _navigateTo(const SettingsScreen()),
            ),
            _buildDrawerItem(
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {},
            ),
            _buildDrawerItem(
              icon: Icons.info,
              title: 'About',
              onTap: () {},
            ),

            const Divider(),

            // Logout
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Logout',
              color: Colors.red,
              onTap: () async {
                await _authService.logout();
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.white70),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: color ?? Colors.white),
      ),
      onTap: onTap,
    );
  }
}