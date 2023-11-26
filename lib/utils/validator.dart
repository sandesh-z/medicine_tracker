class Validator {
  static String? isNotEmpty(String? name) {
    if (name?.isNotEmpty ?? false) return null;
    return "Name can not be empty.";
  }
}
