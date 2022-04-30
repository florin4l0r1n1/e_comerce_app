import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Text title;
  List<Widget> childrens;
  CustomAppBar({
    Key key,
    this.title,
    this.childrens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.red,
      child: Row(
        children: childrens,
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
