import 'package:ong_animals/core/keys/the_cat_key.dart';

class TheCatApiEndPoint {
  TheCatApiEndPoint._instance();

  static String get breeds => 'https://api.thecatapi.com/v1/breeds';

  static Map<String, String> theCatTokenExists() {
    Map<String, String> headers = {
      'x-api-key': TheCatKey.GET,
    };

    return headers;
  }
}
