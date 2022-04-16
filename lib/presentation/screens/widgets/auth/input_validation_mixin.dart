mixin InputValidationMixin {
  bool isPassword1Valid(String password1) =>
      password1.length > 6 && password1.length != null;

  bool isPassword2Valid(String password2) =>
      password2.length > 6 && password2.length != null;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email) && email != null;
  }
}
