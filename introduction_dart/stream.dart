void main(List<String> args) {

  emitNumber().listen((event) {
    print('Desde listen $event');
  });
}


Stream<int> emitNumber(){
  return Stream.periodic( const Duration(seconds: 1), (value){
    // print('desde periodic $value');
    return value;
  }).take(5);
}