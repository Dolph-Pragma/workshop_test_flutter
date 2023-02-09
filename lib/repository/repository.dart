import 'dart:io';

import '../model/model.dart';

final httpClient = HttpClient();

class Repository {
  final RemoteDateSource remoteDateSource;
  Repository(this.remoteDateSource);

  Future<Student> fetch() async {
    late String result;
    try {
      result = await remoteDateSource.fetch();
    } catch (e) {
      throw Exception();
    }
    Student student = Student.fromString(result);
    return student;
  }
}

class RemoteDateSource {
  Future<String> fetch() async {
    final result = await httpClient.get("", 0, "");
    return result.toString();
  }
}
