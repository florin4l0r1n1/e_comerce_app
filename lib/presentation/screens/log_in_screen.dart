import 'package:e_comerce_app/presentation/screens/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String text = "Seller";
  bool isSeller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _sizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _image() {
    return Image.asset('lib/images/comerce.png');
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
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
              CustomTextFormField(
                  labelText: 'Email', hintText: 'example@example.com'),
              _sizedBox(),
              CustomTextFormField(
                  labelText: 'Password',
                  hintText: 'Please enter min 8 characters'),
              _sizedBox(),
              CustomTextFormField(
                  labelText: 'Password', hintText: 'Password must match'),
              _sizedBox(),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
