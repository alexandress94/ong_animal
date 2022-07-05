import 'package:ong_animals/features/domain/entities/cat_entity.dart';

import 'image_model.dart';

class CatModel extends CatEntity {
  CatModel({
    required String name,
    required String image,
    required String origin,
    required String temperament,
    required String lifeSpan,
    required String description,
  }) : super(
          name: name,
          image: image,
          origin: origin,
          temperament: temperament,
          lifeSpan: lifeSpan,
          description: description,
        );

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      name: json['name'],
      image:
          json['image'] != null ? ImageModel.fromJson(json['image']).url : '',
      origin: json['origin'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'] + ' years',
      description: json['description'],
    );
  }
}
