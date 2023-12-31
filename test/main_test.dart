// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:hp/main.dart';

void main() {
  testWidgets('Smoke Test', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome text is displayed.
    expect(find.text('Welcome to Session'), findsOneWidget);

    // Verify that the start button is displayed.
    expect(find.text('start'), findsOneWidget);

    // Tap on the start button to navigate to the Habit screen.
    await tester.tap(find.text('start'));
    await tester.pumpAndSettle();

    // Verify that you are on the Habit screen by checking for a text field.
    expect(find.byType(TextField), findsNWidgets(3));

    // Enter values into the text fields.
    await tester.enterText(find.byKey(const ValueKey('work_duration')), '25');
    await tester.enterText(find.byKey(const ValueKey('break_duration')), '5');
    await tester.enterText(find.byKey(const ValueKey('session_count')), '3');

    // Tap on the Start button to start the session.
    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();

    // Verify that the session details are displayed.
    expect(find.text('Session'), findsOneWidget);
    expect(find.text('25:00'), findsOneWidget);
    expect(find.text('1 / 3'), findsOneWidget);
    expect(find.byIcon(Icons.restart_alt), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);

    // Verify that session begin.
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('25:00'), findsNothing);

    // Verify the pause button is present and is working
    expect(find.byIcon(Icons.pause), findsOneWidget);
    await tester.tap(find.byIcon(Icons.pause));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);

    // Verify the restart button is working
    await tester.tap(find.byIcon(Icons.restart_alt));
    await tester.pumpAndSettle();
    expect(find.text('25:00'), findsOneWidget);

    // Simulate pressing the back button (returning to the previous screen).
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsNWidgets(3));

    // Simulate pressing the data button in the left of the app bar.
    await tester.tap(find.byIcon(Icons.timelapse_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Data'), findsOneWidget);
    expect(find.text("total minutes"), findsOneWidget);
    expect(find.text("longest session"), findsOneWidget);
    expect(find.text("number of sessions"), findsOneWidget);
    expect(find.text("avg session time"), findsOneWidget);
    expect(find.text('total minutes'), findsOneWidget);
    expect(find.text('longest session'), findsOneWidget);
    expect(find.text('number of sessions'), findsOneWidget);
    expect(find.text('avg session time'), findsOneWidget);
  });
}
