// KHO
Stream<int> getStreamIntegers([int length = 10]) async* {
  for (int i = 0; i < length; i++) {
    await Future.delayed(Duration(milliseconds: 100));
    yield i;
  }
}

// KHO
Future<void> sumOfStreamIntegers() async {
  int sum = 0;
  // tính tổng 10 số nguyên của Stream
  await for (final val in getStreamIntegers()) {
    print('sum: $sum --> ${sum + val}');
    sum += val;
  }

  print('sum = $sum');
}

void main() {
  sumOfStreamIntegers();
}
