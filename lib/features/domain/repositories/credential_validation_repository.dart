import 'package:either_dart/either.dart';
import 'package:ong_animals/features/data/models/credential_model.dart';

abstract class CredentialValidationRepository {
  Either<Exception, List<CredentialModel>> checkCredentials();
}
