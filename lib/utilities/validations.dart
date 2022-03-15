import 'package:get/get.dart';

class Validations {
  static emailValidations(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'provide valid email';
    }
    return null;
  }

  static passwordValidations(String value) {
    if (value.length < 5 && value.length < 8) {
      return 'Password must be 5 to 8 characters';
    }
    return null;
  }
}
