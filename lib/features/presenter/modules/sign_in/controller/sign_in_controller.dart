import 'package:ong_animals/core/keys/storage_key.dart';
import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:ong_animals/features/domain/entities/credential_entity.dart';
import 'package:ong_animals/features/domain/usecases/credential_validation_usecase.dart';
import 'package:ong_animals/core/packages/getweays/input_validation.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/routes/routes.dart';
import 'package:ong_animals/features/presenter/utils/message_mixin.dart';

class SignInController extends GetxController with MessageMixin {
  final CredentialValidationUsecase _usecase;
  final LogService _log;
  final LocalStorageService _storage;
  List<CredentialEntity> validCredentials = [];

  final message = Rxn<MessageModel>();

  SignInController({
    required CredentialValidationUsecase usecase,
    required LogService log,
    required LocalStorageService storage,
  })  : _usecase = usecase,
        _storage = storage,
        _log = log;

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    messageListener(message);
    _displayValidCredentials();
  }

  void find() {
    if (formKey.currentState!.validate()) {
      _checkCredential();
    }
  }

  Future<void> _checkCredential() async {
    final result = await _usecase();
    if (result.isLeft) return;

    String email = emailController.text;

    if (result.right.where((entity) {
      _storage.write(
        key: StorageKey.NAME_KEY,
        value: entity.name,
      );

      _storage.write(
        key: StorageKey.REFRESH_TOKEN_KEY,
        value: entity.refreshToken,
      );

      return entity.email == email;
    }).isNotEmpty) {
      Get.offNamed(Routes.HOME_PAGE);
      return;
    }
    message(MessageModel.info('Failure', 'Unauthorized email!'));
    _log.warning('E-MAIL NÃO LOCALIZADO');
  }

  Future<void> _displayValidCredentials() async {
    final result = await _usecase();
    validCredentials =
        result.right.where((entity) => entity.isAutorization == true).toList();
  }

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Required E-mail.';
    } else if (!InputValidation.isEmail(email)) {
      return 'Invalid E-mail.';
    }
    return null;
  }
}
