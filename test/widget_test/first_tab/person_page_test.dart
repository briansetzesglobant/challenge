import 'package:challenge/src/presentation/widget/first_tab/person_image.dart';
import 'package:challenge/src/presentation/widget/first_tab/person_page.dart';
import 'package:challenge/src/presentation/widget/first_tab/person_popularity.dart';
import 'package:challenge/src/presentation/widget/widget_movies.dart';
import 'package:challenge/src/presentation/widget/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PersonPage() should display the person page',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PersonPage(
          personName: 'personName',
          posterPath: 'posterPath',
          popularity: 1.0,
          movies: [],
        ),
      ),
    );
    expect(find.byType(WidgetText), findsOneWidget);
    expect(find.byType(PersonImage), findsOneWidget);
    expect(find.byType(PersonPopularity), findsOneWidget);
    expect(find.byType(WidgetMovies), findsOneWidget);
  });
}
