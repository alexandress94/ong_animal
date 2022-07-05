import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ong_animals/core/bindings/initial_binding.dart';
import 'package:ong_animals/features/presenter/theme/app_theme.dart';
import 'features/presenter/routes/app_pages.dart';
import 'features/presenter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        title: 'ONG Animals',
        locale: const Locale('pt', 'BR'),
        initialRoute: Routes.INITIAL_PAGE,
        getPages: AppPages.routes,
        initialBinding: InitialBinding(),
        theme: AppTheme().appLightThemeData,
      ),
    );
  }
}
