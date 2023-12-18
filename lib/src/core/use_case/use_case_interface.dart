import '../util/numbers.dart';

abstract class UseCaseInterface<T> {
  Future<T> call({
    int? id,
  });
}
