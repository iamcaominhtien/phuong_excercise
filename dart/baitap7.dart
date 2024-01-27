import 'dart:async';

class MyStream<T> {
  StreamController<T> _streamController = StreamController();
  Stream<T> get stream => _streamController.stream;

  void addEvent(T event) {
    _streamController.sink.add(event);
  }

  void dispose() {
    _streamController.close();
  }
}

// KHO
void createStreamEvent<T>(MyStream<T> myStream) async {
  for (int i = 0; i < 10; i++) {
    myStream.addEvent(i as T);
    await Future.delayed(Duration(milliseconds: 200));
  }
  myStream.dispose();
}

// KHO
void main() async {
  MyStream<int> myStream = MyStream<int>();
  createStreamEvent<int>(myStream);

  int sum = 0;
  await for (var val in myStream.stream) {
    print('sum: $sum --> ${sum + val}');
    sum += val;
  }

  print('sum = $sum');
}
