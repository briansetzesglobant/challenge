import 'dart:async';
import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:challenge/src/presentation/bloc/person_bloc.dart';
import 'package:challenge/src/presentation/view/first_tab.dart';
import 'package:challenge/src/presentation/widget/first_tab/person_page.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'first_tab_test.mocks.dart';

@GenerateMocks([
  PersonBloc,
])
void main() {
  late PersonBloc personBloc;
  late DataState<PersonsListEntity> dataStateSuccess;
  late DataState<PersonsListEntity> dataStateEmpty;
  late DataState<PersonsListEntity> dataStateFailed;
  late PersonsListEntity personsListEntity;

  setUp(() {
    personBloc = MockPersonBloc();
    Get.replace(personBloc);
    personsListEntity = PersonsListEntity(
      page: 1,
      results: [
        PersonEntity(
          adult: true,
          gender: 1,
          id: 1,
          knownFor: [],
          knownForDepartment: 'knownForDepartment',
          name: 'name',
          popularity: 1.0,
          profilePath: 'profilePath',
        )
      ],
      totalPages: 1,
      totalResults: 1,
    );
    dataStateSuccess = DataSuccess(
      personsListEntity,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('FirstTab test', () {
    testWidgets('FirstTab() should display the success page',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccess));
      await tester.pumpWidget(
        MaterialApp(
          home: FirstTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsOneWidget);
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('FirstTab() should display the empty page',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateEmpty));
      await tester.pumpWidget(
        MaterialApp(
          home: FirstTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsNothing);
      expect(find.byType(WidgetEmpty), findsOneWidget);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('FirstTab() should display the failed page',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateFailed));
      await tester.pumpWidget(
        MaterialApp(
          home: FirstTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsNothing);
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsOneWidget);
    });
  });
}
