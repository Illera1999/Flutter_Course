void main(List<String> args) {

  Heroe heroe = Heroe(
    'Pikachu', 
    120, 
    true, 
    ['Flauta', 'Psico', 'Ataque'],
    {1: 'ditto/front.png', 2: 'ditto/back.png'}
  );
  heroe.attack('Bulbasaur');

  Enemy enemy = Enemy(
    name: 'Squirtle', 
    power: 'Fuego'
  );
  
  print(enemy);
}


class Heroe{

  String name;
  int hp;
  bool isAlive;
  List<String> abilities;
  Map<int, String> sprites;

  Heroe(
    this.name, 
    this.hp, 
    this.isAlive, 
    this.abilities, 
    this.sprites
  );

  void attack(String enemy) {
    print('The $name attacks the $enemy');
  }
}


class Enemy{

  String name;
  String power;

  Enemy({
    required this.name, 
    required this.power, 
  });

  @override
  String toString() {
    return 'Enemy: $name - $power';
  }

}