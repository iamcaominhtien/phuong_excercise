import 'dart:math';

//HOI KHO
bool containDuplicatedElements(List<int> arr) {
  return arr.toSet().length < arr.length;
}

//KHO
void testBirthdayParadox(int numberOfTrials, [int numberOfPeople = 23]) {
  int count = 0;

  for (int i = 0; i < numberOfTrials; i++) {
    var birthdays =
        List.generate(numberOfPeople, (index) => Random().nextInt(365) + 1);
    if (containDuplicatedElements(birthdays)) {
      count += 1;
    }
  }

  print(
      'The probability of at least two people sharing the same birthday in a group of $numberOfPeople people is ${(count / numberOfTrials).toStringAsFixed(2)}%.');
}

void main() {
  var arr = [1, 1, 2, 3, 4];
  if (containDuplicatedElements(arr)) {
    print('Array ${arr} Contains duplicated elements');
  } else {
    print("Array ${arr} doesn't contain duplicated elements");
  }

  testBirthdayParadox(100000,22);
  testBirthdayParadox(100000,23);
  testBirthdayParadox(100000,24);
}
