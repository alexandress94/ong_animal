import 'package:either_dart/either.dart';
import 'package:ong_animals/core/end_points/the_cat_api_end_point.dart';
import 'package:ong_animals/core/packages/contracts/connect_service.dart';
import 'package:ong_animals/core/response/handle_response.dart';

abstract class GetAllCatsDatasource {
  Future<Either<Exception, HttpResponse>> find();
}

class GetAllCatsDatasourceImpl implements GetAllCatsDatasource {
  final ConnectService _connect;

  GetAllCatsDatasourceImpl(this._connect);

  @override
  Future<Either<Exception, HttpResponse>> find() async {
    final result = await _connect.get(
      TheCatApiEndPoint.breeds,
      headers: TheCatApiEndPoint.theCatTokenExists(),
    );

    return HandleResponse.verify(result);
  }
}
