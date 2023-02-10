import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workshop_test_flutter/model/model.dart';
import 'package:workshop_test_flutter/repository/repository.dart';

class MocktailRemoteDataSource extends Mock implements RemoteDateSource {}

void main() {
  test('Recibe datos correctos de servidor', () async {
    MocktailRemoteDataSource mock = MocktailRemoteDataSource();
    Repository repository = Repository(mock);

    when(() => mock.fetch()).thenAnswer((_) => Future.value("Datos correctos"));

    final result = await repository.fetch();

    expect(result, isA<Student>());
  });

  test('Servidor no responde', () async {
    MocktailRemoteDataSource mock = MocktailRemoteDataSource();
    Repository repository = Repository(mock);

    when(() => mock.fetch())
        .thenThrow((_) => const SocketException('Server Error'));

    expect(repository.fetch(), throwsException);
  });
}
