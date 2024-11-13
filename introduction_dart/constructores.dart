void main(List<String> args) {
  
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': false
  };


  // Heroe heroe = Heroe(
  //   name: 'Tony Stark',
  //   power: 'Money', 
  //   isAlive: rawJson['isAlive'] ?? false
  // );

  Heroe heroe = Heroe.fromJson(rawJson);

  print(heroe);
}


class Heroe{

  String name;
  String power;
  bool isAlive;

  Heroe({
    required this.name, 
    required this.power,
    required this.isAlive,
  });

  Heroe.fromJson(Map<String, dynamic> json):
    name = json['name'] ?? 'No name fount',
    power = json['power'] ?? 'No power fount',
    isAlive = json['isAlive'] ?? 'No isAlive fount';

  @override
  String toString() {
    return 'Heroe: $name - $power ${isAlive ? 'Alive' : 'Dead'}';
  }
} 