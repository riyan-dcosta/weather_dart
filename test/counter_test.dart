import 'package:test/test.dart';
import 'package:weather_dart/counter/counter.dart';

void main() {
  group('counterIncrement', () {
    test('Initial value must be zero', () {
      expect(Counter().value, 0);
    });
    test('Initial Counter after increment must be 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
  });
}
