import 'package:either_dart/either.dart';
import 'package:ong_animals/core/end_points/the_dog_api_end_point.dart';
import 'package:ong_animals/core/packages/contracts/connect_service.dart';
import 'package:ong_animals/core/response/handle_response.dart';

abstract class GetAllDogsDatasource {
  Future<Either<Exception, HttpResponse>> find();
}

class GetAllDogsDatasourceImpl implements GetAllDogsDatasource {
  final ConnectService _connect;

  GetAllDogsDatasourceImpl(this._connect);

  @override
  Future<Either<Exception, HttpResponse>> find() async {
    final result = await _connect.get(
      TheDogApiEndPoint.breeds,
      headers: TheDogApiEndPoint.theDogTokenExists(),
    );

    return HandleResponse.verify(result);
  }
}
