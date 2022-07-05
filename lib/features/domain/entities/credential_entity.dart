import 'package:ong_animals/features/data/models/credential_model.dart';

class CredentialEntity {
  final String email;
  final String name;
  final bool isAutorization;
  final String refreshToken;

  CredentialEntity({
    required this.email,
    required this.name,
    required this.isAutorization,
    required this.refreshToken,
  });

  factory CredentialEntity.fromEntity(CredentialModel model) {
    return CredentialEntity(
      email: model.email,
      name: model.name,
      isAutorization: model.isAutorization,
      refreshToken: model.refreshToken,
    );
  }

  @override
  String toString() {
    return 'CredentialEntity: {email: $email, isAutorization: $isAutorization, refreshToken: $refreshToken}';
  }
}
