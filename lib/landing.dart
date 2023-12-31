// Home screen that displays the logo and a button to start the session

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:hp/app_color.dart';
import 'homepage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          // The main content of the page
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: 1,
                    child: Text(
                      'Welcome to Session',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Arial'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1,
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        PageRouteBuilder<PageRoute<dynamic>>(
                          transitionDuration: const Duration(seconds: 1),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: const HomePage(),
                            );
                          },
                        ),
                      ),
                      child: const Text(
                        'start',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // The footer with the "Made with love in YYC" text
          Container(
            height: 90,
            alignment: Alignment.center,
            child: const Text(
              'Built in YYC by Jash Dubal. Improved by B2RJ.',
              style: TextStyle(
                  fontSize: 12, color: Colors.white24, fontFamily: 'Arial'),
            ),
          ),
        ],
      ),
    );
  }
}
