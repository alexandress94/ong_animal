import 'package:either_dart/either.dart';
import 'package:ong_animals/core/packages/contracts/connect_service.dart';

class HandleResponse {
  HandleResponse.instance();

  static Future<Either<Exception, HttpResponse>> verify(
    HttpResponse response,
  ) async {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 201:
        return Right(response);
      case 204:
        return Right(response);
      case 400:
        return Left(response.data);
      case 404:
        return Left(response.data);
      case 500:
        return Left(response.data);
      case 401:
        return Left(response.data);
      case 409:
        return Left(response.data);
      case 403:
        return Left(response.data);
      default:
        return Left(response.data);
    }
  }
}
