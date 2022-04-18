import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/elevated_auth_button.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/image_widget.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          Navigator.pushNamed(context, '/dashBoard');
        } else if (state is AuthError) {
          return Text(state.error);
        } else if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Unauthenticated) {
          return _buildBody(context);
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
        return const Center(
          child: Text("Center"),
        );
      },
    );
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "e-Shop",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                image(),
                sizedBox(),
                AuthButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/signInScreen'),
                  text: "Sign In",
                ),
                sizedBox(),
                AuthButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/registerScreen'),
                  text: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
