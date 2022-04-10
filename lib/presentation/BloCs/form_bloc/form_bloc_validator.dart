import 'dart:async';

import 'package:rxdart/rxdart.dart';

class FormBloc {
  
  final _emailValidator = BehaviorSubject<String>();
  final _passwordValidator = BehaviorSubject<String>();
  

//Get
  Stream<String> get email => _emailValidator.stream.transform(validateEmail);
  Stream<String> get password =>_passwordValidator.stream.transform(validatePassword);
  Stream<bool> get  formValid=> Rx.combineLatest2(email,password, (userEmail, userPassword)=> true);
 

  //Set

  Function(String) get changeEmail => _emailValidator.sink.add;
  Function(String) get changePassword => _passwordValidator.sink.add;

  dispose() {
    _emailValidator.close();
    _passwordValidator.close();
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

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 8) {
      sink.addError("Password is too short");
    } else {
      sink.add(password);
    }
  });

 
  registerUser() {
    print(
        "user submitted ${_passwordValidator.value} and ${_passwordValidator.value} ");
  }
}
