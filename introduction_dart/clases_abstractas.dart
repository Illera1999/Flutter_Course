void main(List<String> args) {
  
  final windPlant = WindPlant(initialEnergyPlant: 100);
  windPlant.consumeEnergy(10);
  print(windPlant.energyPlant);


  print('wind: ${chargePhone(windPlant)}');

  final nuclearPlant = NuclearPlant( energyPlant: 100);
  print('nuclear: ${chargePhone(nuclearPlant)}');


}

double chargePhone(EnergyPlant plant) {
  if(plant.energyPlant < 10) {
    throw Exception('No hay energía suficiente');
  }
  return plant.energyPlant-10;
}

enum PlantType { nuclear, hydro, solar, wind }

abstract class EnergyPlant {

  double energyPlant;
  PlantType type;


  EnergyPlant({
    required this.energyPlant,
    required this.type
  });

  void consumeEnergy(double energy);

}

class WindPlant extends EnergyPlant {
  WindPlant({
    required double initialEnergyPlant,
  }):super(energyPlant: initialEnergyPlant, type: PlantType.wind);

  void consumeEnergy(double energy) {
    energyPlant -= energy;
  }

}


class NuclearPlant implements EnergyPlant {
  @override
  double energyPlant;
  @override
  PlantType type = PlantType.nuclear;

  @override
  NuclearPlant({
    required this.energyPlant,
  });

  @override
  void consumeEnergy(double energy) {
    energyPlant -= (energy * 0.5);
  }
}