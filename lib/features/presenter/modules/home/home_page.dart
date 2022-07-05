import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ong_animals/features/presenter/global_widget/global_color_loader_widget.dart';
import 'package:ong_animals/features/presenter/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/theme/app_color.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidtht = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ONG ANIMALS'),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,
                color: AppLightColors.appIconGrayColor),
            onPressed: () => controller.nextPageSettings(),
          )
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: controller.isLoading.isFalse,
          replacement: SizedBox(
            width: maxWidtht.w,
            height: maxHeight.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const GlobalColorLoadedWidget(
                  dotRadius: 6.0,
                  radius: 15.0,
                ),
                Text(
                  'Please wait...',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Text(
                    'Wellcome, ${controller.userName.value.split(' ').first}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: maxWidtht,
                  child: GetBuilder<HomeController>(
                    id: 'selected-index',
                    builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int index = 0;
                              index < controller.icons.length;
                              index++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => controller.changeIndex(index),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        controller.selectedIndex.value == index
                                            ? AppLightColors.appSecondaryColor
                                            : AppLightColors.appWhiteColor,
                                    radius: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipOval(
                                        child: Image.asset(
                                          controller.icons[index],
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(controller.description[index]),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                ),
                controller.selectedIndex.value == 0
                    ? _displayAllAnimals(context)
                    : controller.selectedIndex.value == 1
                        ? _showOnlyCats(context)
                        : _showOnlyDogs(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayAllAnimals(BuildContext context) {
    double maxWidtht = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: maxWidtht,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.theCats.length,
            itemBuilder: (_, index) {
              var cat = controller.theCats[index];
              return _displayCardAnimals(
                image: cat.image,
                title: cat.name,
                subtitle: cat.origin,
                lifeSpan: cat.lifeSpan,
                context: context,
                onTap: () {
                  controller.nextPage({'CatEntity': cat});
                },
              );
            },
          ),
        ),
        SizedBox(
          width: maxWidtht,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.theDogs.length,
            itemBuilder: (_, index) {
              var dog = controller.theDogs[index];
              return _displayCardAnimals(
                image: dog.image,
                title: dog.name,
                subtitle: dog.origin,
                lifeSpan: dog.lifeSpan,
                context: context,
                onTap: () {
                  controller.nextPage({'DogEntity': dog});
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _showOnlyCats(BuildContext context) {
    double maxWidtht = MediaQuery.of(context).size.width;
    return SizedBox(
      width: maxWidtht,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.theCats.length,
        itemBuilder: (_, index) {
          var cat = controller.theCats[index];
          return _displayCardAnimals(
            image: cat.image,
            title: cat.name,
            subtitle: cat.origin,
            lifeSpan: cat.lifeSpan,
            context: context,
            onTap: () {
              controller.nextPage({'CatEntity': cat});
            },
          );
        },
      ),
    );
  }

  Widget _showOnlyDogs(BuildContext context) {
    double maxWidtht = MediaQuery.of(context).size.width;
    return SizedBox(
      width: maxWidtht,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.theDogs.length,
        itemBuilder: (_, index) {
          var dog = controller.theDogs[index];
          return _displayCardAnimals(
            title: dog.name,
            subtitle: dog.origin,
            lifeSpan: dog.lifeSpan,
            image: dog.image,
            context: context,
            onTap: () {
              controller.nextPage({'DogEntity': dog});
            },
          );
        },
      ),
    );
  }

  Widget _displayCardAnimals({
    required String image,
    required String title,
    required String subtitle,
    required String lifeSpan,
    required BuildContext context,
    required void Function() onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppLightColors.appWhiteColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      width: Get.width.w,
      height: 200.h,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            image.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: SizedBox(
                      width: Get.width * 0.4,
                      height: 200.h,
                      child: controller.cachedImage.cached(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        placeholder: (_, url) =>
                            Image.memory(kTransparentImage),
                      ),
                    ),
                  )
                : Text(
                    title[0],
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: AppLightColors.appWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
            Container(
              padding: const EdgeInsets.all(16),
              width: 180.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 3,
                        child: Text(
                          subtitle,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: AppLightColors.appSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(lifeSpan),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
