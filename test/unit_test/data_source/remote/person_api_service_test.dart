import 'dart:convert';
import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/data_source/remote/api_service.dart';
import 'package:challenge/src/data/model/person/persons_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as client_library;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'person_api_service_test.mocks.dart';

@GenerateMocks([
  client_library.Client,
])
void main() {
  late ApiService apiService;
  late client_library.Client client;
  late String jsonStringSuccess;
  late String jsonStringEmpty;
  late String jsonStringFailed;

  setUp(() {
    client = MockClient();
    Get.replace(client);
    apiService = ApiService();
    jsonStringEmpty = '''{
      "page": 1,
      "results": [],
      "total_pages": 1,
      "total_results": 1
    }''';
    jsonStringFailed = '''{
      "error": [],
    }''';
    jsonStringSuccess = '''{
      "page": 1,
      "results": [
        {
          "adult": true,
          "gender": 1,
          "id": 1,
          "known_for": [],
          "known_for_department": "known_for_department",
          "name": "name",
          "popularity": 1.0,
          "profile_path": "profile_path"
        }
      ],
      "total_pages": 1,
      "total_results": 1
    }''';
  });

  group('ApiService test', () {
    test(
      'getPersonsList() should get the status success',
      () async {
        when(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).thenAnswer(
          (_) async => client_library.Response(
            jsonStringSuccess,
            HttpStatus.ok,
          ),
        );
        final response = await apiService.getPersonsList();
        verify(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).called(1);
        expect(
          response.data!.results.first.name,
          PersonsList.fromJson(
            json.decode(jsonStringSuccess),
          ).results.first.name,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getPersonsList() should get the status empty',
      () async {
        when(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).thenAnswer(
          (_) async => client_library.Response(
            jsonStringEmpty,
            HttpStatus.ok,
          ),
        );
        final response = await apiService.getPersonsList();
        verify(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'getPersonsList() should get the status failed',
      () async {
        when(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).thenAnswer(
          (_) async => client_library.Response(
            jsonStringFailed,
            HttpStatus.notFound,
          ),
        );
        final response = await apiService.getPersonsList();
        verify(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading persons: ${HttpStatus.notFound}',
        );
        assert(response is DataFailed);
      },
    );

    test(
      'getPersonsList() should get generate an exception',
      () async {
        Exception exception = Exception();
        when(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).thenThrow(exception);
        final response = await apiService.getPersonsList();
        verify(
          client.get(
            Uri.parse(
              'https://api.themoviedb.org/3/person/popular?api_key=385737c6d715026a1cd89526ff9d8d44',
            ),
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading persons: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );
  });
}
