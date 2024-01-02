import 'dart:convert';
import 'dart:io';
import 'package:challenge/src/core/util/endpoints.dart';
import 'package:challenge/src/data/model/person/persons_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../core/resource/data_state.dart';
import '../../../core/util/strings.dart';
import '../../../domain/entity/movie/movies_list_entity.dart';
import '../../../domain/entity/person/persons_list_entity.dart';
import '../../model/movie/movies_list.dart';

class ApiService {
  Client client = Get.find<Client>();

  Future<DataState<PersonsListEntity>> getPersonsList() async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Endpoints.uri}${Endpoints.endpointPerson}${Endpoints.endpointPopular}${Endpoints.apiKeyParameter}${Endpoints.apiKey}',
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
          '${Strings.errorMessagePerson} ${response.statusCode}',
        );
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessagePerson} ${exception.toString()}',
      );
    }
  }

  Future<DataState<MoviesListEntity>> getPopularMoviesList() async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Endpoints.uri}${Endpoints.endpointMovie}${Endpoints.endpointPopular}${Endpoints.apiKeyParameter}${Endpoints.apiKey}',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        MoviesList moviesList = MoviesList.fromJson(
          json.decode(
            response.body,
          ),
          'Popular',
        );
        if (moviesList.results.isNotEmpty) {
          return DataSuccess(
            moviesList,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${Strings.errorMessageMovie} ${response.statusCode}',
        );
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessageMovie} ${exception.toString()}',
      );
    }
  }

  Future<DataState<MoviesListEntity>> getTopRatedMoviesList() async {
    try {
      final response = await client.get(
        Uri.parse(
          '${Endpoints.uri}${Endpoints.endpointMovie}${Endpoints.endpointTopRated}${Endpoints.apiKeyParameter}${Endpoints.apiKey}',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        MoviesList moviesList = MoviesList.fromJson(
          json.decode(
            response.body,
          ),
          'TopRated',
        );
        if (moviesList.results.isNotEmpty) {
          return DataSuccess(
            moviesList,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${Strings.errorMessageMovie} ${response.statusCode}',
        );
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessageMovie} ${exception.toString()}',
      );
    }
  }

  Future<DataState<MoviesListEntity>> getRecommendationsMoviesList({
    required int? id,
  }) async {
    try {
      if (id == null) {
        return const DataEmpty();
      }
      final response = await client.get(
        Uri.parse(
          '${Endpoints.uri}${Endpoints.endpointMovie}$id${Endpoints.endpointRecommendations}${Endpoints.apiKeyParameter}${Endpoints.apiKey}',
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        MoviesList moviesList = MoviesList.fromJson(
          json.decode(
            response.body,
          ),
          'Recommendations',
        );
        if (moviesList.results.isNotEmpty) {
          return DataSuccess(
            moviesList,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${Strings.errorMessageMovie} ${response.statusCode}',
        );
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessageMovie} ${exception.toString()}',
      );
    }
  }
}
