// test/counter_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:gradutionproject/core/counter.dart';
 // Replace with actual path

void main() {
  group('Counter', () {
    test('Initial count should be 0', () {
      final counter = Counter();
      expect(counter.count, equals(0));
    });

    test('Count should increment by 1', () {
      final counter = Counter();
      counter.increment(value: 1); // if value is used
      expect(counter.count, equals(1));
    });

    test('Multiple increments should work correctly', () {
      final counter = Counter();
      counter.increment(value: 1);
      counter.increment(value: 1);
      counter.increment(value: 1);
      expect(counter.count, equals(3));
    });
  });
}
