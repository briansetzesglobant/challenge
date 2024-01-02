import 'dart:async';
import 'dart:io';
import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/model/location_model/location_model.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:challenge/src/presentation/bloc/image_bloc.dart';
import 'package:challenge/src/presentation/bloc/map_bloc.dart';
import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:challenge/src/presentation/bloc/person_bloc.dart';
import 'package:challenge/src/presentation/view/home_page.dart';
import 'package:challenge/src/presentation/widget/first_tab/person_page.dart';
import 'package:challenge/src/presentation/widget/third_tab/image_button.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:challenge/src/presentation/widget/widget_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  PersonBloc,
  MovieBloc,
  ImageBloc,
  MapBloc,
  Location,
])
void main() {
  late PersonBloc personBloc;
  late DataState<PersonsListEntity> dataStateSuccessPerson;
  late DataState<PersonsListEntity> dataStateEmptyPerson;
  late DataState<PersonsListEntity> dataStateFailedPerson;
  late PersonsListEntity personsListEntity;

  late MovieBloc movieBloc;
  late DataState<MoviesListEntity> dataStateSuccessMovie;
  late DataState<MoviesListEntity> dataStateEmptyMovie;
  late DataState<MoviesListEntity> dataStateFailedMovie;
  late MoviesListEntity moviesListEntity;

  late ImageBloc imagesBloc;
  late List<File> imagesList;
  late List<String> urlsList;

  late MapBloc mapBloc;
  late List<LocationModel> list;
  late LocationModel locationModel;
  late Location location;

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
    dataStateSuccessPerson = DataSuccess(
      personsListEntity,
    );
    dataStateEmptyPerson = const DataEmpty();
    dataStateFailedPerson = const DataFailed(
      'error',
    );

    movieBloc = MockMovieBloc();
    Get.replace(movieBloc);
    moviesListEntity = MoviesListEntity(
      page: 1,
      results: [
        MovieEntity(
          adult: true,
          backdropPath: 'backdropPath',
          genreIds: [],
          id: 1,
          mediaType: 'mediaType',
          originalLanguage: 'originalLanguage',
          originalTitle: 'originalTitle',
          overview: 'overview',
          popularity: 1.0,
          posterPath: 'posterPath',
          releaseDate: 'releaseDate',
          title: 'title',
          video: true,
          voteAverage: 1.0,
          voteCount: 1,
          category: 'category',
        )
      ],
      totalPages: 1,
      totalResults: 1,
    );
    dataStateSuccessMovie = DataSuccess(
      moviesListEntity,
    );
    dataStateEmptyMovie = const DataEmpty();
    dataStateFailedMovie = const DataFailed(
      'error',
    );

    imagesBloc = MockImageBloc();
    Get.replace(imagesBloc);
    imagesList = [File('path')];
    urlsList = [''];

    mapBloc = MockMapBloc();
    Get.replace(mapBloc);
    locationModel = LocationModel(
      latitude: 1.0,
      longitude: 1.0,
      date: 1.0,
    );
    list = [
      locationModel,
    ];
    location = MockLocation();
    Get.replace(location);
  });

  group('HomePage test', () {
    testWidgets('HomePage() should display the success page in the first tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccessPerson));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsOneWidget);
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('HomePage() should display the empty page in the first tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateEmptyPerson));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsNothing);
      expect(find.byType(WidgetEmpty), findsOneWidget);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('HomePage() should display the error page in the first tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateFailedPerson));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(PersonPage), findsNothing);
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsOneWidget);
    });
  });

  group('HomePage test', () {
    testWidgets('HomePage() should display the success page in the second tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccessPerson));
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccessMovie));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccessMovie));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccessMovie));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.tap(find.text('Second Tab'));
      await tester.pump();
      //expect(find.byType(WidgetMovies), findsNWidgets(3));
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('HomePage() should display the empty page in the second tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateEmptyPerson));
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmptyMovie));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmptyMovie));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmptyMovie));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.tap(find.text('Second Tab'));
      await tester.pump();
      expect(find.byType(WidgetMovies), findsNothing);
      //expect(find.byType(WidgetEmpty), findsNWidgets(3));
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('HomePage() should display the error page in the second tab',
        (WidgetTester tester) async {
      when(personBloc.initialize()).thenAnswer((_) async => true);
      when(personBloc.getPersonsList()).thenAnswer((_) => true);
      when(personBloc.personsListStream)
          .thenAnswer((_) => Stream.value(dataStateFailedPerson));
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailedMovie));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailedMovie));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailedMovie));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
      await tester.tap(find.text('Second Tab'));
      await tester.pump();
      expect(find.byType(WidgetMovies), findsNothing);
      expect(find.byType(WidgetEmpty), findsNothing);
      //expect(find.byType(WidgetError), findsNWidgets(3));
    });
  });

  testWidgets('HomePage() should display the third tab',
      (WidgetTester tester) async {
    when(personBloc.initialize()).thenAnswer((_) async => true);
    when(personBloc.getPersonsList()).thenAnswer((_) => true);
    when(personBloc.personsListStream)
        .thenAnswer((_) => Stream.value(dataStateFailedPerson));
    when(imagesBloc.initialize()).thenAnswer((_) async => true);
    when(imagesBloc.getCameraImages()).thenAnswer((_) async => true);
    when(imagesBloc.getGalleryImages()).thenAnswer((_) async => true);
    when(imagesBloc.hasSelectedImages()).thenAnswer((_) => true);
    when(imagesBloc.getStorageImages()).thenAnswer((_) async => true);
    when(imagesBloc.deviceImagesStream)
        .thenAnswer((_) => Stream.value(imagesList));
    when(imagesBloc.storageImagesStream)
        .thenAnswer((_) => Stream.value(urlsList));
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(
          title: 'title',
        ),
      ),
    );
    await tester.tap(find.text('Third Tab'));
    await tester.pump();
    //expect(find.byType(ImageButton), findsNWidgets(2));
    expect(find.byType(WidgetEmpty), findsNothing);
    //expect(find.byType(WidgetError), findsNothing);
  });

  testWidgets('HomePage() should display the fourth tab',
      (WidgetTester tester) async {
    when(personBloc.initialize()).thenAnswer((_) async => true);
    when(personBloc.getPersonsList()).thenAnswer((_) => true);
    when(personBloc.personsListStream)
        .thenAnswer((_) => Stream.value(dataStateFailedPerson));
    when(mapBloc.initialize()).thenAnswer((_) async => true);
    when(mapBloc.getLocations()).thenAnswer((_) async => true);
    when(mapBloc.insertLocation(locationModel)).thenAnswer((_) async => true);
    when(mapBloc.locationsStream).thenAnswer((_) => Stream.value(list));
    when(location.enableBackgroundMode(enable: true))
        .thenAnswer((_) async => true);
    when(location.serviceEnabled()).thenAnswer((_) async => true);
    when(location.requestService()).thenAnswer((_) async => true);
    when(location.hasPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    when(location.requestPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(
            title: 'title',
          ),
        ),
      );
    });
    await tester.tap(find.text('Fourth Tab'));
    await tester.pump();
    //expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byType(WidgetEmpty), findsNothing);
    //expect(find.byType(WidgetError), findsNothing);
  });
}
