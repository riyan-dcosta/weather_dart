import 'package:test/test.dart';
import 'package:weather_dart/counter/counter.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });
  group('counterIncrement', () {
P    test('Initial value must be zero', () {
      expect(counter.value, 0);
    });
    test('Initial Counter after increment must be 1', () {
      counter.increment();
      expect(counter.value, 1);
    });
  });
}
