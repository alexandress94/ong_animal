import 'package:ong_animals/features/data/models/dog_model.dart';

class DogEntity {
  final String name;
  final String image;
  final String origin;
  final String temperament;
  final String lifeSpan;
  final String bredFor;

  DogEntity({
    required this.name,
    required this.image,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.bredFor,
  });

  factory DogEntity.fromEntity(DogModel model) {
    return DogEntity(
      name: model.name,
      image: model.image,
      origin: model.origin,
      temperament: model.temperament,
      lifeSpan: model.lifeSpan,
      bredFor: model.bredFor,
    );
  }

  @override
  String toString() {
    return 'DogEntity: {name: $name, image: $image, origin: $origin, temperament: $temperament}';
  }
}
