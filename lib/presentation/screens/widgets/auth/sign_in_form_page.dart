import 'package:e_comerce_app/presentation/screens/widgets/utils/elevated_auth_button.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/profile_text.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/sized_box.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';

class SignInFormPage extends StatelessWidget {
  SignInFormPage({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
                    text: "Sell/Buy",
                  ),
                  sizedBox(),
                  CustomTextFormField(
                    validator: (email) {},
                    labelText: 'Email',
                    hintText: 'example@example.com',
                  ),
                  sizedBox(),
                  CustomTextFormField(
                    validator: (password1) {},
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
                    onPressed: () {},
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
