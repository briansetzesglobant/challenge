import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/src/presentation/widget/first_tab/person_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PersonImage() should display the image',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PersonImage(
          posterPath:
              'https://image.tmdb.org/t/p/w185/8LpnMIqpRiwxpbGR33ALCmVl7gj.jpg',
        ),
      ),
    );
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
