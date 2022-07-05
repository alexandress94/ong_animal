import 'package:either_dart/either.dart';
import 'package:ong_animals/features/data/models/dog_model.dart';
import 'package:ong_animals/features/domain/entities/dog_entity.dart';
import 'package:ong_animals/features/domain/repositories/get_all_dogs_repository.dart';

class GetAllDogsUsecase {
  final GetAllDogsRepository _repository;

  GetAllDogsUsecase(this._repository);

  Future<Either<Exception, List<DogEntity>>> call() async {
    final result = await _repository.find();

    if (result.isLeft) {
      return Left(Exception('Não foi possível obter o repositório'));
    }

    final List<DogModel> models = result.right;

    final List<DogEntity> dogLists =
        models.map((model) => DogEntity.fromEntity(model)).toList();

    return Right(dogLists);
  }
}
