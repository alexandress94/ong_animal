import 'package:ong_animals/core/packages/getweays/log_service_impl.dart';
import 'package:ong_animals/features/data/datasources/credential_validation_datasource_impl.dart';
import 'package:ong_animals/features/data/repositories/credential_validation_repository_impl.dart';
import 'package:ong_animals/features/domain/repositories/credential_validation_repository.dart';
import 'package:ong_animals/features/domain/usecases/credential_validation_usecase.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<CredentialValidationRepository>(
      () => CredentialValidationRepositoryImpl(
        CredentialValidationDatasourceImpl(),
      ),
    );

    // Controller
    Get.lazyPut<SignInController>(
      () => SignInController(
        log: LogServiceImpl(),
        usecase: CredentialValidationUsecase(
          Get.find(),
        ),
        storage: Get.find(),
      ),
    );
  }
}
