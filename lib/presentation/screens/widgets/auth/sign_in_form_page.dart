import 'package:e_comerce_app/presentation/screens/widgets/auth/input_validation_mixin.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/elevated_auth_button.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/profile_text.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/sized_box.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';

class SignInFormPage extends StatefulWidget {
  SignInFormPage({Key key}) : super(key: key);

  @override
  State<SignInFormPage> createState() => _SignInFormPageState();
}

class _SignInFormPageState extends State<SignInFormPage>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  String title = "Seller";
  bool isSeller = false;

  void _update() {
    setState(() {
      if (title == "Seller") {
        isSeller = false;
        title = "Buyer";
      } else {
        isSeller = true;
        title = "Seller";
      }
    });
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
                  ProfileText(
                    title: title,
                  ),
                  sizedBox(),
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
                  sizedBox(),
                  CustomTextFormField(
                    validator: (password) {
                      if (isPassword1Valid(password)) {
                        return null;
                      } else {
                        return "Please enter a valid password";
                      }
                    },
                    labelText: 'Password',
                    hintText: 'Please enter min 8 characters',
                  ),
                  sizedBox(),
                  AuthButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                    text: "Sign In",
                  ),
                  AuthButton(
                    onPressed: () => _update(),
                    text: "Change Profile",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
