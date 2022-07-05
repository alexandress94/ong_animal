import 'package:either_dart/either.dart';
import 'package:ong_animals/features/data/models/credential_model.dart';
import 'package:ong_animals/features/domain/entities/credential_entity.dart';
import 'package:ong_animals/features/domain/repositories/credential_validation_repository.dart';

class CredentialValidationUsecase {
  final CredentialValidationRepository _repository;

  CredentialValidationUsecase(this._repository);

  Future<Either<Exception, List<CredentialEntity>>> call() async {
    final result = _repository.checkCredentials();

    if (result.isLeft) {
      return Left(Exception('Não foi possível obter o repositório'));
    }

    final List<CredentialModel> models = result.right;

    final List<CredentialEntity> credentialLists =
        models.map((model) => CredentialEntity.fromEntity(model)).toList();

    return Right(credentialLists);
  }
}
