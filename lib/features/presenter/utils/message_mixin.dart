import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/theme/app_color.dart';

mixin MessageMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        _elegantNotificationWidget(
          type: model.type,
          message: message.value!,
        );
      }
    });
  }

  Future<void> _elegantNotificationWidget({
    required MessageType type,
    required MessageModel message,
  }) async {
    if (type == MessageType.sucess) {
      return ElegantNotification.success(
        toastDuration: const Duration(seconds: 4),
        notificationPosition: NotificationPosition.top,
        animation: AnimationType.fromRight,
        title: Text(message.title,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appBlackColor,
            )),
        description: Text(message.message,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appIconGrayColor,
            )),
        onActionPressed: () {
          Get.back();
        },
      ).show(Get.overlayContext!);
    } else if (type == MessageType.infor) {
      return ElegantNotification.info(
        onActionPressed: () {
          Get.back();
        },
        toastDuration: const Duration(seconds: 4),
        notificationPosition: NotificationPosition.top,
        animation: AnimationType.fromRight,
        title: Text(message.title,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appBlackColor,
            )),
        description: Text(message.message,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appIconGrayColor,
            )),
      ).show(Get.overlayContext!);
    } else {
      return ElegantNotification.error(
        toastDuration: const Duration(seconds: 4),
        notificationPosition: NotificationPosition.top,
        animation: AnimationType.fromRight,
        title: Text(message.title,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appBlackColor,
            )),
        description: Text(message.message,
            style: Get.textTheme.bodyText1?.copyWith(
              color: AppLightColors.appIconGrayColor,
            )),
        onActionPressed: () {
          Get.back();
        },
      ).show(Get.overlayContext!);
    }
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel.error(this.title, this.message) : type = MessageType.error;
  MessageModel.sucess(this.title, this.message) : type = MessageType.sucess;
  MessageModel.info(this.title, this.message) : type = MessageType.infor;
}

enum MessageType { error, sucess, infor }

extension MessageTypeExtension on MessageType {
  Color get color {
    switch (this) {
      case MessageType.infor:
        return Colors.blue[200] ?? Colors.blue;
      case MessageType.error:
        return Colors.red[600] ?? Colors.red;
      case MessageType.sucess:
        return Colors.green;
    }
  }
}
