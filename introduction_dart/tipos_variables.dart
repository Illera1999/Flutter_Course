


void main(List<String> args) {


  final String pokemon = "Pikachu";
  final int hp = 120;
  final bool isAlive = true;
  final List<String> abilidades = ["Flauta", "Psico", "Ataque"];

  final sprites = <String>['ditto/front.png', 'ditto/back.png'];


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