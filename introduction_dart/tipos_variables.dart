


void main(List<String> args) {


  final String pokemon = "Pikachu";
  final int hp = 120;
  final bool isAlive = true;
  final List<String> abilidades = ["Flauta", "Psico", "Ataque"];

  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

  //dynamic == null
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = 123;
  errorMessage = 'Hola';
  errorMessage = ['Hola', 'Hola'];
  errorMessage = () => true;
  errorMessage = null;

  // errorMessage +=1


  print(
  """
    $pokemon
    $hp
    $isAlive
    ${abilidades.toString()}
    $sprites
  """ 
  );

}