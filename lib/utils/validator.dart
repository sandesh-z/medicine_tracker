import 'package:medicine_tracker/core/localization/strings.dart';

class Validator {
  static String? isNotEmpty(String? name) {
    if (name?.isNotEmpty ?? false) return null;
    return strings.med_name_cannot_be_empty;
  }
}
