// Mocks generated by Mockito 5.4.0 from annotations
// in challenge/test/unit_test/repository/recommendations_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:challenge/src/core/resource/data_state.dart' as _i3;
import 'package:challenge/src/data/data_source/local/app_data_base.dart' as _i4;
import 'package:challenge/src/data/data_source/local/challenge_data_base.dart'
    as _i9;
import 'package:challenge/src/data/data_source/remote/api_service.dart' as _i5;
import 'package:challenge/src/domain/entity/movie/movie_entity.dart' as _i11;
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart'
    as _i8;
import 'package:challenge/src/domain/entity/person/person_entity.dart' as _i10;
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart'
    as _i7;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_1<T> extends _i1.SmartFake implements _i3.DataState<T> {
  _FakeDataState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAppDataBase_2 extends _i1.SmartFake implements _i4.AppDataBase {
  _FakeAppDataBase_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i5.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  set client(_i2.Client? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i3.DataState<_i7.PersonsListEntity>> getPersonsList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPersonsList,
          [],
        ),
        returnValue: _i6.Future<_i3.DataState<_i7.PersonsListEntity>>.value(
            _FakeDataState_1<_i7.PersonsListEntity>(
          this,
          Invocation.method(
            #getPersonsList,
            [],
          ),
        )),
      ) as _i6.Future<_i3.DataState<_i7.PersonsListEntity>>);

  @override
  _i6.Future<_i3.DataState<_i8.MoviesListEntity>> getPopularMoviesList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMoviesList,
          [],
        ),
        returnValue: _i6.Future<_i3.DataState<_i8.MoviesListEntity>>.value(
            _FakeDataState_1<_i8.MoviesListEntity>(
          this,
          Invocation.method(
            #getPopularMoviesList,
            [],
          ),
        )),
      ) as _i6.Future<_i3.DataState<_i8.MoviesListEntity>>);

  @override
  _i6.Future<_i3.DataState<_i8.MoviesListEntity>> getTopRatedMoviesList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMoviesList,
          [],
        ),
        returnValue: _i6.Future<_i3.DataState<_i8.MoviesListEntity>>.value(
            _FakeDataState_1<_i8.MoviesListEntity>(
          this,
          Invocation.method(
            #getTopRatedMoviesList,
            [],
          ),
        )),
      ) as _i6.Future<_i3.DataState<_i8.MoviesListEntity>>);

  @override
  _i6.Future<_i3.DataState<_i8.MoviesListEntity>> getRecommendationsMoviesList(
          {required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendationsMoviesList,
          [],
          {#id: id},
        ),
        returnValue: _i6.Future<_i3.DataState<_i8.MoviesListEntity>>.value(
            _FakeDataState_1<_i8.MoviesListEntity>(
          this,
          Invocation.method(
            #getRecommendationsMoviesList,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.DataState<_i8.MoviesListEntity>>);
}

/// A class which mocks [ChallengeDataBase].
///
/// See the documentation for Mockito's code generation for more information.
class MockChallengeDataBase extends _i1.Mock implements _i9.ChallengeDataBase {
  MockChallengeDataBase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AppDataBase get challengeDataBase => (super.noSuchMethod(
        Invocation.getter(#challengeDataBase),
        returnValue: _FakeAppDataBase_2(
          this,
          Invocation.getter(#challengeDataBase),
        ),
      ) as _i4.AppDataBase);

  @override
  set challengeDataBase(_i4.AppDataBase? _challengeDataBase) =>
      super.noSuchMethod(
        Invocation.setter(
          #challengeDataBase,
          _challengeDataBase,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i10.PersonEntity>> selectAllPersonEntity() =>
      (super.noSuchMethod(
        Invocation.method(
          #selectAllPersonEntity,
          [],
        ),
        returnValue:
            _i6.Future<List<_i10.PersonEntity>>.value(<_i10.PersonEntity>[]),
      ) as _i6.Future<List<_i10.PersonEntity>>);

  @override
  _i6.Future<void> insertPersonEntity(_i10.PersonEntity? personEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertPersonEntity,
          [personEntity],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> deleteAllPersonEntity() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllPersonEntity,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i11.MovieEntity>> selectAllMovieEntity() =>
      (super.noSuchMethod(
        Invocation.method(
          #selectAllMovieEntity,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieEntity>>.value(<_i11.MovieEntity>[]),
      ) as _i6.Future<List<_i11.MovieEntity>>);

  @override
  _i6.Future<_i11.MovieEntity?> selectMovieEntity(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #selectMovieEntity,
          [id],
        ),
        returnValue: _i6.Future<_i11.MovieEntity?>.value(),
      ) as _i6.Future<_i11.MovieEntity?>);

  @override
  _i6.Future<void> insertMovieEntity(_i11.MovieEntity? movieEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertMovieEntity,
          [movieEntity],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> deleteMovieEntity(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteMovieEntity,
          [id],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i11.MovieEntity>> selectMovieEntityByCategory(
          String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #selectMovieEntityByCategory,
          [category],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieEntity>>.value(<_i11.MovieEntity>[]),
      ) as _i6.Future<List<_i11.MovieEntity>>);
}
