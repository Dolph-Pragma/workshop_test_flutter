class Student {
  String student = '';
  Student(String result) {
    student = result;
  }

  static fromString(String result) => Student(result);
}
