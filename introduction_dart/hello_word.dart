
void main(List<String> args) {

  print('Hello World!');

  var name = 'Jose ';
  print(name);

  final edad = 25; // Variables final no podemos modificar
  late String dir; // Variables late no se inicializan

  const pi = 3.14; // Constantes no se pueden modificar
                  // y no se pueden declarar sin valor
  
  
  dir = 'Las Palmas'; 

  print('Hola $name y tengo $edad años');
  print('Dirección ${dir.toUpperCase()}');
  print('El valor de pi es $pi');
}