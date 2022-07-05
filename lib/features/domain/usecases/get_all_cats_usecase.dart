import 'package:either_dart/either.dart';
import 'package:ong_animals/features/data/models/cat_model.dart';
import 'package:ong_animals/features/domain/entities/cat_entity.dart';
import 'package:ong_animals/features/domain/repositories/get_all_cats_repository.dart';

class GetAllCatsUsecase {
  final GetAllCatsRepository _repository;

  GetAllCatsUsecase(this._repository);

  Future<Either<Exception, List<CatEntity>>> call() async {
    final result = await _repository.find();

    if (result.isLeft) {
      return Left(Exception('Não foi possível obter o repositório'));
    }

    final List<CatModel> models = result.right;

    final List<CatEntity> catLists =
        models.map((model) => CatEntity.fromEntity(model)).toList();

    return Right(catLists);
  }
}
