import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/auth/sign_in_form_page.dart';
import 'package:e_comerce_app/presentation/screens/widgets/auth/sign_up_form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInFormPage(),
    );
  }
}
