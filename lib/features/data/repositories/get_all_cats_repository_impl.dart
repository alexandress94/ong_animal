import 'package:ong_animals/features/data/datasources/get_all_cats_datasource_impl.dart';
import 'package:ong_animals/features/domain/repositories/get_all_cats_repository.dart';
import 'package:ong_animals/features/data/models/cat_model.dart';
import 'package:either_dart/either.dart';

class GetAllCatsRepositoryImpl implements GetAllCatsRepository {
  final GetAllCatsDatasource _datasource;

  GetAllCatsRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, List<CatModel>>> find() async {
    final response = await _datasource.find();

    if (response.isLeft) {
      return Left(Exception('Falha ao acessar datasource'));
    }

    final List<dynamic> data = response.right.data;

    final List<CatModel> catLists =
        data.map((model) => CatModel.fromJson(model)).toList();

    return Right(catLists);
  }
}
