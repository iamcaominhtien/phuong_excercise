void main() {
  // convertArrToMap();

  printSquareElementFromArray();
}

void printSquareElementFromArray() {
  List<int> arr = [1, 2, 3, 4, 5, 6];

  //in ra bình phương các phần tử của danh sách
  arr.forEach((element) {
    print(element * element);
  });
}

void convertArrToMap() {
  List<String> arrString = [
    'Chic Avenue',
    'Fashionista',
    'Glamour Galore',
    'Haute Couture',
    'Runway Rave',
    'Style Avenue',
    'Trendy Threads',
    'Urban Vogue',
    'Vintage Vixen',
    'Wardrobe Wonders'
  ];
  var mapStringAndLength = {};

  //chuyển một danh sách các chuỗi thành danh sách chiều dài của các chuỗi đó.
  //cach 1: dung loop
  arrString.forEach((element) {
    mapStringAndLength[element] = element.length;
  });
  print(mapStringAndLength);

  //cach 2: dung Map constructor
  mapStringAndLength = Map.fromIterable(
    arrString,
    key: (element) => element,
    value: (element) => element.length,
  );
  print(mapStringAndLength);
}
