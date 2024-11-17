void main(List<String> args) {
  
  emitNumber().listen((event) {
    print('Sream value: $event');
  });

}


Stream<int> emitNumber() async*{

  final valuesToEmit = [1,2,3,4,5];
  for(final value in valuesToEmit) {
    await Future.delayed(Duration(seconds: 1));
    yield value;
  }

}