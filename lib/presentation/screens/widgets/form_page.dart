import 'package:e_comerce_app/presentation/screens/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'input_validation_mixin.dart';

class FormPage extends StatelessWidget with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String p1;
  String p2;

  FormPage({Key key, this.p1, this.p2}) : super(key: key);

  Widget _sizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _image() {
    return Image.asset('lib/images/comerce.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Buy or sell',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _image(),
                  _sizedBox(),
                  /*  TextFormField(
                      validator: (email) {
                        if (isEmailValid(email)) {
                          return null;
                        }
                        return "Please entre a valid email";
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        fillColor: Colors.green,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      )),*/

                  CustomTextFormField(
                    validator: (email) {
                      if (isEmailValid(email)) {
                        return null;
                      } else {
                        return "Please enter a valid email address";
                      }
                    },
                    labelText: 'Email',
                    hintText: 'example@example.com',
                  ),
                  _sizedBox(),
                  CustomTextFormField(
                    validator: (pass1) {
                      p1 = pass1;
                      if (isPassword1Valid(pass1)) {
                        return null;
                      } else {
                        return "Please enter a valid password";
                      }
                    },
                    labelText: 'Password',
                    hintText: 'Please enter min 8 characters',
                  ),
                  _sizedBox(),
                  CustomTextFormField(
                    validator: (pass2) {
                      p2 = pass2;
                      if (isPassword2Valid(pass2)) {
                        return null;
                      }
                      if (isPassword1Valid(p1) != (isPassword2Valid(pass2))) {
                        return "Passwords doesen t match";
                      } else {
                        return "Please repeat password";
                      }
                    },
                    labelText: 'Password',
                    hintText: 'Password must match',
                  ),
                  _sizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text(
                      'LogIn/SignUp',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Change profile'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Already account',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
