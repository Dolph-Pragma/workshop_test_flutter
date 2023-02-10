import 'dart:io';

import 'package:workshop_test_flutter/repository/repository.dart';

class MockRemoteDataSourceSuccess implements RemoteDateSource {
  @override
  Future<String> fetch() async {
    return await Future.delayed(
        const Duration(seconds: 2), () => "Mock Result");
    //return Future.value("Mock Result");
  }
}

class MockRemoteDataSourceFailure implements RemoteDateSource {
  @override
  Future<String> fetch() {
    throw const SocketException('Mock Exception');
  }
}
