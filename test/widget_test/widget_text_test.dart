import 'package:challenge/src/presentation/widget/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WidgetText() should display the text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WidgetText(
          text: 'text',
        ),
      ),
    );
    expect(find.text('text'), findsOneWidget);
  });
}
