// Mocks generated by Mockito 5.4.0 from annotations
// in challenge/test/unit_test/bloc/map_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:challenge/src/data/data_source/local/location_data_base.dart'
    as _i2;
import 'package:challenge/src/data/model/location_model/location_model.dart'
    as _i4;
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

/// A class which mocks [LocationDatabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationDatabase extends _i1.Mock implements _i2.LocationDatabase {
  MockLocationDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> insertLocation(_i4.LocationModel? location) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertLocation,
          [location],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i4.LocationModel>> getLocations() => (super.noSuchMethod(
        Invocation.method(
          #getLocations,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.LocationModel>>.value(<_i4.LocationModel>[]),
      ) as _i3.Future<List<_i4.LocationModel>>);
}
