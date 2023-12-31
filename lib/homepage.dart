// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// 🌎 Project imports:
import 'package:hp/app_color.dart';
import 'package:hp/pages/data.dart';
import 'package:hp/pages/habit.dart';
import 'package:hp/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        animationCurve: Curves.easeInOut,
        backgroundColor: AppColors.backgroundColor,
        buttonBackgroundColor: AppColors.primaryColor,
        color: AppColors.primaryColor,
        animationDuration: const Duration(milliseconds: 350),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        index: 1,
        items: const [
          Icon(Icons.timelapse_rounded,
              size: 20, color: AppColors.backgroundColor),
          Icon(Icons.fitbit_rounded,
              size: 20, color: AppColors.backgroundColor),
          Icon(Icons.history_rounded,
              size: 20, color: AppColors.backgroundColor),
        ],
      ),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return const Data();
      case 2:
        return const Settings();
      default:
        return const Habit();
    }
  }
}
