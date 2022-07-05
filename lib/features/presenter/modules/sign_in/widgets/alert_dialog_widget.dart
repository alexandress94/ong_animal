import 'package:ong_animals/features/presenter/modules/sign_in/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends GetView<SignInController> {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Valid E-mail list"),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      actions: controller.validCredentials
          .map(
            (credential) => Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(credential.email),
              ),
            ),
          )
          .toList(),
    );
  }
}
