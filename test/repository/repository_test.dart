import 'package:flutter_test/flutter_test.dart';
import 'package:workshop_test_flutter/model/model.dart';
import 'package:workshop_test_flutter/repository/repository.dart';

import '../mocks/mock_remote_data_source.dart';

void main() {
  test('Retorna el servidor info correcta', () async {
    Repository repository = Repository(MockRemoteDataSourceSuccess());
    final result = await repository.fetch();

    expect(result, isA<Student>());
  });

  test('Servidor se cae', () async {
    Repository repository = Repository(MockRemoteDataSourceFailure());

    expect(() => repository.fetch(), throwsException);
  });
}
