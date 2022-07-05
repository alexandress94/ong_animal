import 'package:ong_animals/features/presenter/modules/animal_detail/binding/animal_detail_binding.dart';
import 'package:ong_animals/features/presenter/modules/settings/binding/settings_binding.dart';
import 'package:ong_animals/features/presenter/modules/settings/settings_page.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/binding/sign_in_binding.dart';
import 'package:ong_animals/features/presenter/modules/splash/binding/splash_binding.dart';
import 'package:ong_animals/features/presenter/modules/home/binding/home_binding.dart';
import 'package:ong_animals/features/presenter/modules/animal_detail/animal_detail_page.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/sign_in_page.dart';
import 'package:ong_animals/features/presenter/modules/splash/splash_page.dart';
import 'package:ong_animals/features/presenter/modules/home/home_page.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL_PAGE,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN_PAGE,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      page: () => const AnimalDatailPage(),
      name: Routes.ANIMAL_DETAIL_PAGE,
      binding: AnimalDetailBinding(),
    ),
    GetPage(
      page: () => const SettingsPage(),
      name: Routes.SETTINGS_PAGE,
      binding: SettingsBinding(),
    ),
  ];
}
