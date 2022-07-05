import 'package:ong_animals/features/data/models/dog_model.dart';
import 'package:either_dart/either.dart';

abstract class GetAllDogsRepository {
  Future<Either<Exception, List<DogModel>>> find();
}
