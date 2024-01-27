void main() {
  String sentence = "hg hg f  f ght,ght re";
  List<String> words = sentence.toLowerCase().split(RegExp(r"[\s,]+"));
  Map<String, int> outputMap = {};
  for (String word in words) {
    outputMap[word] = (outputMap[word] ?? 0) + 1;
  }

  for (final item in outputMap.entries) {
    print('${item.key}: ${item.value}');
  }
}
