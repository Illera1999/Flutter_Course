void main(List<String> args) {

  final numbers = [1, 2, 2, 3, 4, 5, 5, 5, 6, 7, 8, 8, 9, 10];

  print('Lista original: ${numbers.toSet().toList()}');
  print('Length: ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('Index 0: ${numbers.first}');
  print('Reverse: ${numbers.reversed}');

  final reverse = numbers.reversed;
  print('Reverse: ${reverse}');
  print('List: ${reverse.toList()}');
  print('Set: ${reverse.toSet()}');

  final numberGreaterThan5 = numbers.where((number) => number > 5);

  print ('Numbers greater than 5: ${numberGreaterThan5.toSet()}');

}