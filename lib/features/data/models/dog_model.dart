import 'package:ong_animals/features/domain/entities/dog_entity.dart';
import 'image_model.dart';

class DogModel extends DogEntity {
  DogModel({
    required String name,
    required String image,
    required String origin,
    required String temperament,
    required String lifeSpan,
    required String bredFor,
  }) : super(
          name: name,
          image: image,
          origin: origin,
          temperament: temperament,
          lifeSpan: lifeSpan,
          bredFor: bredFor,
        );

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      name: json['name'],
      image:
          json['image'] != null ? ImageModel.fromJson(json['image']).url : '',
      origin: json['origin'] ?? 'Unknown',
      temperament: json['temperament'] ?? 'Unknown',
      lifeSpan: json['life_span'],
      bredFor: json['bred_for'] ?? 'Unknown',
    );
  }
}
