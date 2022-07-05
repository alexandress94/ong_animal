import 'package:ong_animals/features/data/datasources/get_all_dogs_datasource_impl.dart';
import 'package:ong_animals/features/domain/repositories/get_all_dogs_repository.dart';
import 'package:ong_animals/features/data/models/dog_model.dart';
import 'package:either_dart/either.dart';

class GetAllDogsRepositoryImpl implements GetAllDogsRepository {
  final GetAllDogsDatasource _datasource;

  GetAllDogsRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, List<DogModel>>> find() async {
    final response = await _datasource.find();

    if (response.isLeft) {
      return Left(Exception('Falha ao acessar datasource'));
    }

    final List<dynamic> data = response.right.data;

    final List<DogModel> dogLists =
        data.map((model) => DogModel.fromJson(model)).toList();

    return Right(dogLists);
  }
}
