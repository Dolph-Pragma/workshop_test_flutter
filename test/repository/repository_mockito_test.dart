import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:workshop_test_flutter/model/model.dart';
import 'package:workshop_test_flutter/repository/repository.dart';

import 'repository_mockito_test.mocks.dart';

@GenerateMocks([RemoteDateSource])
void main() {
  test('Datos de estudiante son retornados', () async {
    MockRemoteDateSource mockDS = MockRemoteDateSource();
    Repository repository = Repository(mockDS);

    when(mockDS.fetch())
        .thenAnswer((_) => Future.value("Resultado Data mockito"));

    final result = await repository.fetch();

    expect(result, isA<Student>());
  });

  test('Servidor no responde', () async {
    MockRemoteDateSource mockDS = MockRemoteDateSource();
    Repository repository = Repository(mockDS);

    when(mockDS.fetch())
        .thenThrow((_) => const SocketException("Servidor no responde"));

    expect(() => repository.fetch(), throwsException);
  });
}
