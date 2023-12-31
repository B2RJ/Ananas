// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:window_manager/window_manager.dart';

// 🌎 Project imports:
import 'package:hp/landing.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  if (Platform.isMacOS) {
    final windowManager = WindowManager.instance;
    windowManager.setMinimumSize(const Size(1650, 1600));
    windowManager.setMaximumSize(const Size(1650, 1600));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          final mediaQueryData = MediaQuery.of(context);
          const screenWidth = 250.0;
          const screenHeight = 400.0;
          return MediaQuery(
            data: mediaQueryData.copyWith(
              size: const Size(screenWidth, screenHeight),
              devicePixelRatio: mediaQueryData.devicePixelRatio,
            ),
            child: const SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: LandingPage(),
            ),
          );
        },
      ),
    );
  }
}
