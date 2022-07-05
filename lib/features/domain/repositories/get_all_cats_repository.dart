import 'package:either_dart/either.dart';
import 'package:ong_animals/features/data/models/cat_model.dart';

abstract class GetAllCatsRepository {
  Future<Either<Exception, List<CatModel>>> find();
}
