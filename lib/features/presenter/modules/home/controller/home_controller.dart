import 'package:get/get.dart';
import 'package:ong_animals/core/keys/storage_key.dart';
import 'package:ong_animals/core/packages/contracts/cached_image.dart';
import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:ong_animals/features/domain/entities/cat_entity.dart';
import 'package:ong_animals/features/domain/entities/dog_entity.dart';
import 'package:ong_animals/features/domain/usecases/get_all_cats_usecase.dart';
import 'package:ong_animals/features/domain/usecases/get_all_dogs_usecase.dart';
import 'package:ong_animals/features/presenter/routes/routes.dart';
import 'package:ong_animals/features/presenter/utils/loader_mixin.dart';
import 'package:ong_animals/features/presenter/utils/message_mixin.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  final GetAllCatsUsecase _catUsecase;
  final GetAllDogsUsecase _dogUsecase;
  final LogService _log;
  final LocalStorageService _sotrage;
  final CachedImage _cachedImage;

  CachedImage get cachedImage => _cachedImage;

  RxString userName = ''.obs;
  RxInt selectedIndex = 0.obs;

  final message = Rxn<MessageModel>();
  RxBool isLoading = false.obs;

  RxList<CatEntity> theCats = <CatEntity>[].obs;
  RxList<DogEntity> theDogs = <DogEntity>[].obs;

  @override
  onInit() async {
    messageListener(message);
    await _getAllAnimals();
    userName.value = await _sotrage.read(StorageKey.NAME_KEY) as String;
    super.onInit();
  }

  HomeController({
    required GetAllCatsUsecase catUsecase,
    required GetAllDogsUsecase dogUsecase,
    required CachedImage cachedImage,
    required LogService log,
    required LocalStorageService storage,
  })  : _catUsecase = catUsecase,
        _dogUsecase = dogUsecase,
        _sotrage = storage,
        _cachedImage = cachedImage,
        _log = log;

  List<String> icons = [
    'assets/images/pat_icon.png',
    'assets/images/cat_icon.png',
    'assets/images/dog_icon.png',
  ];

  List<String> description = [
    'All',
    'Cats',
    'Dogs',
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
    update(['selected-index']);
  }

  Future<void> _getAllAnimals() async {
    isLoading.value = true;
    await _getAllCats();
    await _getAllDogs();
    isLoading.value = false;
  }

  Future<void> _getAllCats() async {
    final result = await _catUsecase();

    if (result.isLeft) {
      isLoading.value = false;
      _log.error(result.left.toString());
      return;
    }

    theCats.assignAll(result.right);
    _log.debug(result.right);
  }

  Future<void> _getAllDogs() async {
    final result = await _dogUsecase();

    if (result.isLeft) {
      isLoading.value = false;
      _log.error(result.left.toString());
      return;
    }

    theDogs.assignAll(result.right);
    _log.debug(result.right);
  }

  void nextPage(Map<String, dynamic> entity) {
    Get.toNamed(Routes.ANIMAL_DETAIL_PAGE, arguments: entity);
  }

  void nextPageSettings() {
    Get.toNamed(Routes.SETTINGS_PAGE);
  }
}
