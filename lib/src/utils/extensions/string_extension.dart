extension StringExtension on String {
  bool isValidUsername() => length >= 8 && length <= 16;

  bool isValidEmail() {
    return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        ).hasMatch(this) &&
        RegExp(r'.*(?=@)').firstMatch(this)![0]!.length >= 8;
  }

  bool isValidPassword() => length >= 8;

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
