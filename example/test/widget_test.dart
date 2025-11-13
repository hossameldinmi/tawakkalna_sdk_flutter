import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tawakkalna_sdk_flutter_example/main.dart';

void main() {
  testWidgets('Tawakkalna demo app loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app bar is displayed
    expect(find.text('Tawakkalna SDK Demo'), findsOneWidget);

    // Verify the initial message is shown
    expect(find.text('Tap any button to call an API method'), findsOneWidget);

    // Verify at least some method buttons are present
    expect(find.text('Generate Token'), findsOneWidget);
    expect(find.text('Get Full Name'), findsAtLeastNWidgets(1));
  });

  testWidgets('Method buttons work', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find and tap a method button
    await tester.tap(find.text('Generate Token').first);
    await tester.pump();

    // Wait for async operations to complete
    await tester.pumpAndSettle();

    // Verify that result cards are displayed
    expect(find.byType(Card), findsWidgets);
  });
}
