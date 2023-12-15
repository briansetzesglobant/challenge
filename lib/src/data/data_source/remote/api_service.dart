import 'dart:convert';
import 'dart:io';
import 'package:challenge/src/core/util/endpoints.dart';
import 'package:challenge/src/data/model/persons_list.dart';
import 'package:http/http.dart';
import '../../../core/resource/data_state.dart';
import '../../../core/util/strings.dart';
import '../../../domain/entity/persons_list_entity.dart';

class ApiService {
  Client client = Client();

  Future<DataState<PersonsListEntity>> getPersonsList() async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Endpoints.uri}${Endpoints.endpointPopularMovies}${Endpoints.apiKeyParameter}${Endpoints.apiKey}',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        PersonsList personsList = PersonsList.fromJson(
          json.decode(response.body),
        );
        if (personsList.results.isNotEmpty) {
          return DataSuccess(
            personsList,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${Strings.error} ${response.statusCode}',
        );
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.error} ${exception.toString()}',
      );
    }
  }
}
