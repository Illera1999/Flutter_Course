void main(List<String> args) {
  
  final Map<String,dynamic> pokemon = {
    'name': 'Pikachu',
    'hp': 120,
    'isAlive': true,
    'abilities': ['Flauta', 'Psico', 'Ataque'],
    'sprites': {
      1: 'ditto/front.png', 
      2: 'ditto/back.png'
    }
  };

  print(pokemon);
  print('Name: ${pokemon['name']}');
  print('Name: ${pokemon['sprites']}');
  
  print('Back: ${pokemon['sprites'][2]}');
  print('Front: ${pokemon['sprites'][1]}');

}