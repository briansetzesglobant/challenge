import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WidgetEmpty() should display the icon and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WidgetEmpty(
          icon: Icons.hourglass_empty,
          message: 'message',
        ),
      ),
    );
    expect(find.byIcon(Icons.hourglass_empty), findsOneWidget);
    expect(find.text('message'), findsOneWidget);
  });
}
