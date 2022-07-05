import 'package:get/get.dart';
import 'package:ong_animals/core/packages/contracts/connect_service.dart';
import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:ong_animals/core/packages/getweays/connect_service_impl.dart';
import 'package:ong_animals/core/packages/getweays/local_storage_service_impl.dart';
import 'package:ong_animals/core/packages/getweays/log_service_impl.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.putAsync<LogService>(
      () => LogServiceImpl().getInstance(),
      permanent: true,
    );

    Get.putAsync<ConnectService>(
      () => ConnectServiceImpl().getInstance(),
      permanent: true,
    );

    Get.put<LocalStorageService>(
      LocalStorageServiceImpl(),
      permanent: true,
    );
  }
}
