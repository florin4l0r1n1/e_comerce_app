
import 'package:e_comerce_app/presentation/BloCs/form_bloc/form_bloc_validator.dart';
import 'package:e_comerce_app/presentation/screens/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formBloc = Provider.of<FormBloc>(context);
    
    return Scaffold(body: _buildBody(context, formBloc));
  }

  Widget _sizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _image() {
    return Image.asset('lib/images/comerce.png');
  }

  Widget _buildBody(BuildContext context, FormBloc bloc) {
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
                    'Buy or sell',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _image(),
                  _sizedBox(),
                  StreamBuilder<Object>(
                      stream: bloc.email,
                      builder: (context, snapshot) {
                        return CustomTextFormField(
                            onChanged: bloc.changeEmail,
                            errorText: snapshot.error,
                            labelText: 'Email',
                            hintText: 'example@example.com');
                      }),
                  _sizedBox(),
                  StreamBuilder<Object>(
                      stream: bloc.password1,
                      builder: (context, snapshot) {
                        return CustomTextFormField(
                            onChanged: bloc.changePassword1,
                            errorText: snapshot.error,
                            labelText: 'Password',
                            hintText: 'Please enter min 8 characters');
                      }),
                  _sizedBox(),
                  StreamBuilder<Object>(
                      stream: bloc.password2,
                      builder: (context, snapshot) {
                        return CustomTextFormField(
                            onChanged: bloc.changePassword2,
                            errorText: snapshot.error,
                            labelText: 'Password',
                            hintText: 'Password must match');
                      }),
                  _sizedBox(),
                  StreamBuilder<Object>(
                      stream: bloc.formValid,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: (){},
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
                        );
                      }),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
