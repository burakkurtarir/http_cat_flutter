import 'dart:math' as math;

final _rand = math.Random();

extension ListExtension<T> on List<T> {
  T randomElement() {
    return this[_rand.nextInt(length)];
  }
}
