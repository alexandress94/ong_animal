import 'package:either_dart/src/either.dart';
import 'package:ong_animals/features/data/datasources/credential_validation_datasource_impl.dart';
import 'package:ong_animals/features/data/models/credential_model.dart';
import 'package:ong_animals/features/domain/repositories/credential_validation_repository.dart';

class CredentialValidationRepositoryImpl
    implements CredentialValidationRepository {
  final CredentialValidationDatasource _datasource;

  CredentialValidationRepositoryImpl(this._datasource);

  @override
  Either<Exception, List<CredentialModel>> checkCredentials() {
    final result = _datasource.checkCredentials();

    if (result['statusCode'] == 200) {
      List<Map<String, dynamic>> data = result['credentials'];

      var credentialLists =
          data.map((json) => CredentialModel.fromJson(json)).toList();

      return Right(credentialLists);
    }

    return Left(Exception('Não foi possível consultar as credenciais'));
  }
}
