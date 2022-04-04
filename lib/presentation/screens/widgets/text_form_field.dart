import 'package:flutter/material.dart';

@immutable
class CustomTextFormField extends StatelessWidget {
  String labelText;
  String hintText;
  CustomTextFormField({
    Key key,
    @required this.labelText,
    @required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: Colors.green,
            labelText: labelText,
            hintText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
    );
  }
}
