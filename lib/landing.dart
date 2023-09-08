// Home screen that displays the logo and a button to start the session

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import 'homepage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
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
                        fontSize: 32, color: Colors.white, fontFamily: 'Arial'),
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: const HomePage(),
                          );
                        },
                      ),
                    ),
                    child: const Text(
                      'start',
                      style: TextStyle(color: Colors.greenAccent),
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
            child: GestureDetector(
              onTap: () {
                _launchURL(); // Fonction pour ouvrir le lien lorsque le texte est cliqué
              },
              child: const Text(
                'Développé avec amour par Richoulebg. ♡',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Arial',
                ),
              ),
            ))
      ]),
    );
  }

  // Fonction pour ouvrir le lien dans le navigateur
  _launchURL() async {
    var uri = Uri.http('paypal.me', '/RichardBruneau');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible d\'ouvrir l\'URL : $uri';
    }
  }
}
