import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/global_widget/global_color_loader_widget.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loader) {
    ever<bool>(loader, (loading) {
      if (loading) {
        Get.dialog(
          const Center(
            child: GlobalColorLoadedWidget(
              dotRadius: 6.0,
              radius: 15.0,
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
