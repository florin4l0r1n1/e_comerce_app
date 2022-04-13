import 'package:flutter/material.dart';

@immutable
class CustomTextFormField extends StatelessWidget {
  Function validator;
  Function onChanged;
  String errorText;
  String labelText;
  String hintText;
  CustomTextFormField({
    Key key,
    this.validator,
    this.errorText,
    this.onChanged,
    @required this.labelText,
    @required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: TextFormField(
            validator: validator,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            errorText: errorText,
            fillColor: Colors.green,
            labelText: labelText,
            hintText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
    );
  }
}
