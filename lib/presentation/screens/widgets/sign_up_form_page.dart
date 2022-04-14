import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/text_form_field.dart';
import 'input_validation_mixin.dart';

enum Profile { signIn, signUp, seller, buyer }

// ignore: must_be_immutable
class SignUpFormPage extends StatelessWidget with InputValidationMixin {
  final Profile profile;
  String email;
  String password1;
  String password2;

  SignUpFormPage(
      {Key key, this.email, this.password1, this.password2, this.profile})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String primaryText;
  String secondaryText;

  Widget _sizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _image() {
    return Image.asset('lib/images/comerce.png');
  }

  void _signUpWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignUpRequested(email, password2));
    }
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
                  Text(
                    primaryText = profile == Profile.buyer ? "Buy" : "Sell",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _image(),
                  _sizedBox(),
                  CustomTextFormField(
                    validator: (email) {
                      if (isEmailValid(email)) {
                        email = email;
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
                    validator: (password1) {
                      password1 = password1;
                      if (isPassword1Valid(password1)) {
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
                    validator: (password2) {
                      password2 = password2;
                      if (isPassword2Valid(password2)) {
                        return null;
                      }
                      if (isPassword1Valid(password1) !=
                          (isPassword2Valid(password2))) {
                        return "Password don t match";
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
                        _signUpWithEmailAndPassword(context);
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
                    child: Text(
                      secondaryText =
                          profile == Profile.signIn ? "LogIn" : "Register",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      profile == Profile.seller
                          ? Profile.buyer
                          : Profile.seller;
                      print(primaryText);
                    },
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
                    onPressed: () => profile == Profile.signIn
                        ? Profile.signUp
                        : Profile.signIn,
                    child: const Text(
                      'Already an account',
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
