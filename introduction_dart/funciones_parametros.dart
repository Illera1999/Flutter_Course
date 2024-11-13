void main(List<String> args) {
  
  print(greetEveryone());
  print('Suma: ${addTwoNumbers(1, 2)}');
  print(greetPerson(nombre: 'Juan', apellido: 'Perez'));
}

String greetEveryone() => 'Hola a todos';

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [int b = 0]) {
  return a + b;
}

String greetPerson({required String nombre, String? apellido}) {
  return 'Hola $nombre $apellido';
}


