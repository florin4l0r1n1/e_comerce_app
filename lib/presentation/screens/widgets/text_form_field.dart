import 'package:flutter/material.dart';

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
    return TextFormField(
        decoration:  InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border:const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      fillColor: Colors.grey,
    ));
  }
}
