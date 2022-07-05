import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/modules/animal_detail/controller/animal_detail_controller.dart';
import 'package:ong_animals/features/presenter/theme/app_color.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimalDatailPage extends GetView<AnimalDetailController> {
  const AnimalDatailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                controller.cachedImage.cached(
                  imageUrl: controller.imageBackground,
                  fit: BoxFit.cover,
                  width: maxWidth,
                  height: maxHeight * 0.6,
                  placeholder: (_, url) => Image.memory(kTransparentImage),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 70.0),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppLightColors.appBarBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 16.0,
              ),
              child: Text(
                controller.animalName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 8.0,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _animalDetailsTitle(context: context, title: 'Description: '),
                  const SizedBox(height: 10.0),
                  _animalDetailsInfo(context: context, info: controller.detail),
                  const SizedBox(height: 20.0),
                  _animalDetailsTitle(context: context, title: 'Life: '),
                  const SizedBox(height: 10.0),
                  _animalDetailsInfo(
                    context: context,
                    info: controller.lifeSpan,
                  ),
                  const SizedBox(height: 20.0),
                  _animalDetailsTitle(context: context, title: 'Origin: '),
                  const SizedBox(height: 10.0),
                  _animalDetailsInfo(
                    context: context,
                    info: controller.origin,
                  ),
                  const SizedBox(height: 20.0),
                  _animalDetailsTitle(context: context, title: 'Temperament: '),
                  const SizedBox(height: 10.0),
                  _animalDetailsInfo(
                    context: context,
                    info: controller.temperament,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _animalDetailsInfo(
      {required BuildContext context, required String info}) {
    return Text(
      info,
      textAlign: TextAlign.justify,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: AppLightColors.appSecondaryColor),
    );
  }

  Text _animalDetailsTitle(
      {required BuildContext context, required String title}) {
    return Text(title, style: Theme.of(context).textTheme.bodyText1);
  }
}
