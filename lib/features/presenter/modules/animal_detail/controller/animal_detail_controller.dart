import 'package:get/get.dart';
import 'package:ong_animals/core/packages/contracts/cached_image.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:ong_animals/features/domain/entities/cat_entity.dart';
import 'package:ong_animals/features/domain/entities/dog_entity.dart';

class AnimalDetailController extends GetxController {
  final CachedImage _cachedImage;
  final LogService _log;
  final Map<String, dynamic> _arguments;
  late CatEntity catEntity;
  late DogEntity dogEntity;

  String imageBackground = '';
  String animalName = '';
  String origin = '';
  String lifeSpan = '';
  String detail = '';
  String temperament = '';

  CachedImage get cachedImage => _cachedImage;

  AnimalDetailController({
    required Map<String, dynamic> arguments,
    required LogService log,
    required CachedImage cachedImage,
  })  : _arguments = arguments,
        _cachedImage = cachedImage,
        _log = log;

  @override
  void onInit() {
    if (_arguments['CatEntity'] != null) {
      catEntity = _arguments['CatEntity'] as CatEntity;
      imageBackground = catEntity.image;
      animalName = catEntity.name;
      origin = catEntity.origin;
      lifeSpan = '${catEntity.lifeSpan} years';
      detail = catEntity.description;
      temperament = catEntity.temperament;
      _log.debug(_arguments['CatEntity']);
      return;
    }
    if (_arguments['DogEntity'] != null) {
      dogEntity = _arguments['DogEntity'] as DogEntity;
      imageBackground = dogEntity.image;
      animalName = dogEntity.name;
      origin = dogEntity.origin;
      lifeSpan = dogEntity.lifeSpan;
      detail = dogEntity.bredFor;
      temperament = dogEntity.temperament;
      _log.debug(_arguments['DogEntity']);
      return;
    }
    super.onInit();
  }
}
