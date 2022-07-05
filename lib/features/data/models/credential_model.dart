import 'package:ong_animals/features/domain/entities/credential_entity.dart';

class CredentialModel extends CredentialEntity {
  CredentialModel({
    required String email,
    required String name,
    required bool isAutorization,
    required String refreshToken,
  }) : super(
          email: email,
          name: name,
          isAutorization: isAutorization,
          refreshToken: refreshToken,
        );

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      email: json['email'],
      name: json['name'],
      isAutorization: json['autorization'],
      refreshToken: json['refreshToken'],
    );
  }
}
