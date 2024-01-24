class GeneralFun {
  static bool checkEmailFormat(String email) {
    RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );
    if (!emailRegExp.hasMatch(email)) {
      return true;
    }
    return false;
  }
}
