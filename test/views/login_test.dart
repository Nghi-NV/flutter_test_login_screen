import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:validation/utils/testing.dart';
import 'package:validation/views/login.dart';

void main() {
  group("Test login screen", () {
    testWidgets("Should have Here to Get text", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));

      expect(find.text("Here to Get"), findsOneWidget);
    });

    testWidgets("Should show text when typing input",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));

      await tester.enterText(
          find.byKey(TestingKey.loginEmail), "nghinv@lumi.biz");

      expect(find.text("nghinv@lumi.biz"), findsOneWidget);
    });

    testWidgets("Should show error text when type email wrong",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));

      await tester.enterText(find.byKey(TestingKey.loginEmail), "nghinv");
      // wait a frame
      await tester.pump();

      expect(find.text("Enter correct email"), findsOneWidget);
    });
  });
}
