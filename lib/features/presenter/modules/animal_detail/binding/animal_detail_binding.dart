import 'package:get/get.dart';
import 'package:ong_animals/core/packages/getweays/cached_image_impl.dart';
import 'package:ong_animals/features/presenter/modules/animal_detail/controller/animal_detail_controller.dart';

class AnimalDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AnimalDetailController>(
      AnimalDetailController(
        arguments: Get.arguments as Map<String, dynamic>,
        log: Get.find(),
        cachedImage: CachedImageImpl(),
      ),
    );
  }
}
