// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:hp/homepage.dart';
import 'package:hp/pages/data.dart';
import 'package:hp/pages/habit.dart';
import 'package:hp/pages/settings.dart';

void main() {
  testWidgets('HomePage should have a bottom navigation bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byType(CurvedNavigationBar), findsOneWidget);
  });

  testWidgets('HomePage should show the Habit widget by default',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byType(Habit), findsOneWidget);
  });

  testWidgets(
      'HomePage should show the Data widget when the first item is selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.tap(find.byIcon(Icons.timelapse_rounded));
    await tester.pump();
    expect(find.byType(Data), findsOneWidget);
  });

  testWidgets(
      'HomePage should show the Settings widget when the third item is selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.tap(find.byIcon(Icons.history_rounded));
    await tester.pump();
    expect(find.byType(Settings), findsOneWidget);
  });
}
