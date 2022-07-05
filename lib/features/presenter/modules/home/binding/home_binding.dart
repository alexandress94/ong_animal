import 'package:get/get.dart';
import 'package:ong_animals/core/packages/getweays/cached_image_impl.dart';
import 'package:ong_animals/features/data/datasources/get_all_cats_datasource_impl.dart';
import 'package:ong_animals/features/data/datasources/get_all_dogs_datasource_impl.dart';
import 'package:ong_animals/features/data/repositories/get_all_cats_repository_impl.dart';
import 'package:ong_animals/features/data/repositories/get_all_dogs_repository_impl.dart';
import 'package:ong_animals/features/domain/repositories/get_all_cats_repository.dart';
import 'package:ong_animals/features/domain/repositories/get_all_dogs_repository.dart';
import 'package:ong_animals/features/domain/usecases/get_all_cats_usecase.dart';
import 'package:ong_animals/features/domain/usecases/get_all_dogs_usecase.dart';
import 'package:ong_animals/features/presenter/modules/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // repository
    Get.lazyPut<GetAllCatsRepository>(
      () => GetAllCatsRepositoryImpl(
        GetAllCatsDatasourceImpl(
          Get.find(),
        ),
      ),
    );

    Get.lazyPut<GetAllDogsRepository>(
      () => GetAllDogsRepositoryImpl(
        GetAllDogsDatasourceImpl(
          Get.find(),
        ),
      ),
    );
    // controller
    Get.lazyPut<HomeController>(
      () => HomeController(
        catUsecase: GetAllCatsUsecase(
          Get.find(),
        ),
        log: Get.find(),
        storage: Get.find(),
        dogUsecase: GetAllDogsUsecase(
          Get.find(),
        ),
        cachedImage: CachedImageImpl(),
      ),
    );
  }
}
