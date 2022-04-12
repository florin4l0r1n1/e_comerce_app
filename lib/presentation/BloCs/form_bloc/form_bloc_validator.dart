import 'dart:async';
import 'package:rxdart/rxdart.dart';

class FormBloc {
  final _emailValidator = BehaviorSubject<String>();
  final _password1Validator = BehaviorSubject<String>();
  final _password2Validator = BehaviorSubject<String>();

  Stream<String> get email => _emailValidator.stream.transform(validateEmail);
  Stream<String> get password1 =>
      _password1Validator.stream.transform(validatePassword1);
  Stream<String> get password2 =>
      _password2Validator.stream.transform(validatePassword2);

  Stream<bool> get formValid => Rx.combineLatest3(
      email, password1, password2, (email, password1, password2) => true);

  Function(String) get changeEmail => _emailValidator.sink.add;
  Function(String) get changePassword1 => _password1Validator.sink.add;
  Function(String) get changePassword2 => _password2Validator.sink.add;

  dispose() {
    _emailValidator.close();
    _password1Validator.close();
    _password2Validator.close();
  }

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Email is bad formatterd");
    }
  });

  final validatePassword1 =
      StreamTransformer<String, String>.fromHandlers(handleData: (p1, sink) {
    if (p1.length < 3) {
      sink.addError("Password is too short");
    } else {
      sink.add(p1);
    }
  });

  final validatePassword2 = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.addError("Password doesent match");
    }
    sink.add(password);
  });

  registerUser() {
    print(
        "user submitted ${_password1Validator.value} and ${_password2Validator.value} and ${_emailValidator.value} ");
  }
}
