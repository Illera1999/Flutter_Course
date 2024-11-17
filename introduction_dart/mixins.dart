void main(List<String> args) {
  
  final flipper = Delfin();
  flipper.nadar();

  final cat = Gato();
  cat.caminar();

  final troti = Tiburon();
  troti.nadar();

  final pato = Pato();
  pato.volar();
  pato.caminar();
  pato.nadar();
}


abstract class Animal {
}


abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

mixin Volador {
  void volar() {
    print('Volando');
  }
}

mixin Caminandor {
  void caminar() {
    print('Caminando');
  }
}

mixin Nadador {
  void nadar() {
    print('Nadando');
  }
}


class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminandor {}
class Gato extends Mamifero with Caminandor {}


class Paloma extends Ave with Caminandor, Volador {}
class Pato extends Ave with Caminandor, Volador, Nadador {}


class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador, Volador {}