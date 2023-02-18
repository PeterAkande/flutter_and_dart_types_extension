extension StringExtesions on String {
  ///Checks if the string is an email
  bool get isEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}
