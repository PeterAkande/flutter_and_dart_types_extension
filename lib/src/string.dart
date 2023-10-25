extension StringExtension on String {
  static final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final nameRegExp =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  static final passwordRegExp = RegExp(
      r"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$");
  static final phoneNumberRegExp = RegExp(r"^\+?0[0-9]{10}$");

  static final urlRegExp = RegExp(
      r"(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])");

  /// Checks if the String is a Valid Email Address
  bool get isValidEmail => emailRegExp.hasMatch(this);

  /// Checks if the String is a valid name
  bool get isValidName => nameRegExp.hasMatch(this);

  /// Checks if the String is a valid Url or link
  bool get isValidLink => urlRegExp.hasMatch(this);

  /// Checks if the String is a Strong password and contains the A Capital Letter,
  /// A lowercase letter, a number
  bool get isValidPassword => passwordRegExp.hasMatch(this);

  /// Checks if the String is a valid phone number
  bool get isValidPhoneNum => phoneNumberRegExp.hasMatch(this);

  /// Capitalize the First Letter
  String get capitalizeFirst => replaceFirst(this[0], this[0].toUpperCase());
}
