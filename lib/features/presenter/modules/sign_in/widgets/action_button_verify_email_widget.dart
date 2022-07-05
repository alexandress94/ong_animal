import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/controller/sign_in_controller.dart';
import 'package:ong_animals/features/presenter/theme/app_color.dart';

class ActionButtonVerifyEmailWidget extends GetView<SignInController> {
  const ActionButtonVerifyEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () => controller.find(),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          height: 60.0,
          decoration: BoxDecoration(
            color: AppLightColors.appBlackColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'ENTER',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppLightColors.appWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
