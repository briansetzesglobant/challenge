import 'package:challenge/src/presentation/widget/first_tab/person_popularity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PersonPopularity() should display the popularity',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: PersonPopularity(
              popularity: 1.0,
            ),
          ),
        );
        expect(find.text('Popularity: 1.0'), findsOneWidget);
      });
}
