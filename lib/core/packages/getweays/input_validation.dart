import 'package:all_validations_br/all_validations_br.dart';

class InputValidation {
  InputValidation.instance();

  static bool isEmail(String email) {
    return AllValidations.isEmail(email);
  }
}
