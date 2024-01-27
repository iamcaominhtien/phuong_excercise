import 'dart:math';

Future<int> lateNum() {
  return Future.delayed(
    Duration(seconds: 1),
    () => Random().nextInt(1000),
  );
}

void main() async {
  int number = await lateNum();
  if (number % 2 == 0) {
    print('$number LA SO CHAN');
  } else {
    print('$number LA SO LE');
  }
}
