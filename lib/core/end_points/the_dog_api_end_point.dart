import 'package:ong_animals/core/keys/the_dog_key.dart';

class TheDogApiEndPoint {
  TheDogApiEndPoint._instance();

  static String get breeds => 'https://api.thedogapi.com/v1/breeds';

  static Map<String, String> theDogTokenExists() {
    Map<String, String> headers = {
      'x-api-key': TheDogKey.GET,
    };

    return headers;
  }
}
