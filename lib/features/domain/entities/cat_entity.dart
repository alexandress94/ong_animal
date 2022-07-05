import 'package:ong_animals/features/data/models/cat_model.dart';

class CatEntity {
  final String name;
  final String image;
  final String origin;
  final String temperament;
  final String lifeSpan;
  final String description;

  CatEntity({
    required this.name,
    required this.image,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.description,
  });

  factory CatEntity.fromEntity(CatModel model) {
    return CatEntity(
      name: model.name,
      image: model.image,
      origin: model.origin,
      temperament: model.temperament,
      lifeSpan: model.lifeSpan,
      description: model.description,
    );
  }

  @override
  String toString() {
    return 'CatEntity: {name: $name, image: $image, origin: $origin, temperament: $temperament}';
  }
}
