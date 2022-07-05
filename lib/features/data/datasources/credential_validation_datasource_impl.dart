import 'package:ong_animals/features/data/datasources/mock/credentials_mock.dart';

abstract class CredentialValidationDatasource {
  Map<String, dynamic> checkCredentials();
}

class CredentialValidationDatasourceImpl
    implements CredentialValidationDatasource {
  @override
  Map<String, dynamic> checkCredentials() {
    final result = CREDENTIALS_MOCK;

    try {
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
