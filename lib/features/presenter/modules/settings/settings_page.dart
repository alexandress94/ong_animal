import 'package:flutter/material.dart';
import 'package:ong_animals/features/presenter/modules/settings/controller/settings_controller.dart';
import 'package:ong_animals/features/presenter/theme/app_color.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.exit_to_app, size: 40),
              title: Text('Logout',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppLightColors.appBlackColor)),
              subtitle: Text('Exit the app',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppLightColors.appSecondaryColor)),
              onTap: () async => await controller.removeUserData(),
            ),
            const Divider(height: 1, thickness: 1)
          ],
        ),
      ),
    );
  }
}
