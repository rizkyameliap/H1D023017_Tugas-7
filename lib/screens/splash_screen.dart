import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:h1d023017_tugas7/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.security_rounded,
              size: 80,
              color: Colors.white,
            )
                .animate()
                .scale(duration: 1000.ms)
                .then(delay: 500.ms)
                .shake(),
            const SizedBox(height: 20),
            Text(
              'SecureApp',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
                .animate()
                .fadeIn(duration: 800.ms)
                .then(delay: 300.ms)
                .slideY(begin: -0.5),
            const SizedBox(height: 10),
            Text(
              'Your Security, Our Priority',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ).animate().fadeIn(delay: 1000.ms),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ).animate().fadeIn(delay: 1500.ms),
          ],
        ),
      ),
    );
  }
}