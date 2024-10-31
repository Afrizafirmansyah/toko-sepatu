import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login/main.dart';

void main() {
  testWidgets('Login page has a title and a button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the title 'Login' is present.
    expect(find.text('Login'), findsOneWidget);
    
    // Verify that the subtitle is also present.
    expect(find.text('Silahkan login terlebih dahulu'), findsOneWidget);
    
    // Verify that the Login button is present.
    expect(find.text('Login'), findsOneWidget);

    // Verify that there are text fields for email and password.
    expect(find.byType(TextField), findsNWidgets(2)); // Expecting 2 TextFields.
  });
}
