import 'package:e_comerce_app/presentation/screens/widgets/utils/elevated_auth_button.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/profile_text.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'input_validation_mixin.dart';

class SignUpFormPage extends StatelessWidget with InputValidationMixin {
  String email;
  String password1;
  String password2;

  SignUpFormPage({Key key, this.email, this.password1, this.password2})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String primaryText;

  String secondaryText;

  void _signUpWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState.validate()) {
      // BlocProvider.of<AuthBloc>(context).add(SignUpRequested(email,password2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
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
                  ProfileText(text: "Sell/Buy"),
                  sizedBox(),
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
                  sizedBox(),
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
                  sizedBox(),
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
                  sizedBox(),
                  AuthButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _signUpWithEmailAndPassword(context);
                      }
                    },
                    text: "Register",
                  ),
                  AuthButton(onPressed: () {}, text: "Change Profile"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
