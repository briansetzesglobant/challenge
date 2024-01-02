import 'package:challenge/src/presentation/widget/third_tab/image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ImageButton() should display the text from button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ImageButton(
          text: 'text',
          onPressed: () {},
        ),
      ),
    );
    expect(find.text('text'), findsOneWidget);
  });
}
