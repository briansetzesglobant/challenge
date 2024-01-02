import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WidgetError() should display the icon and error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WidgetError(
          error: 'error',
        ),
      ),
    );
    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.text('error'), findsOneWidget);
  });
}
