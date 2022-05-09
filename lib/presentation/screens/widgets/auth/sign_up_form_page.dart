import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/elevated_auth_button.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/profile_text.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'input_validation_mixin.dart';

class SignUpFormPage extends StatefulWidget {
  SignUpFormPage({Key key}) : super(key: key);

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String title = "Seller";
  bool isSeller = false;
  String email1;
  String password1;
  String password2;

  void _signUpWithEmailAndPassword(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignUpRequested(email1, password2));
  }

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
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Theme.of(context).colorScheme.primary,
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
                      email1 = email;
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
                      password1 = password;
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
                    validator: (password) {
                      password2 = password;
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
                  AuthButton(
                      onPressed: () => _update(), text: "Change Profile"),
                  sizedBox(),
                  TextButton(
                    onPressed: () {
                      print("register");
                      Navigator.pushReplacementNamed(context, '/signInScreen');
                    },
                    child: const Text("Already an account"),
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
