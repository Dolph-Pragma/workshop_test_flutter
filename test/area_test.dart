import 'package:flutter_test/flutter_test.dart';
import 'package:workshop_test_flutter/area.dart';

void main() {
  late Area area;

  setUp(() {
    area = Area();
  });
  group('Area de circulp', () {
    test('Area de circulo con radio 1', () {
      //Act
      double result = area.circle(1);

      //Assert
      expect(result, 3.141592);
    });

    test('Area de circulo con radio 10', () {
      //Act
      double result = area.circle(10);

      //Assert
      expect(result, 314.1592);
    });
  });

  test('Obtener el valor de pi', () {
    //Arrange
    //Act
    //Assert
    expect(Area.pi, 3.141592);
  });
}
