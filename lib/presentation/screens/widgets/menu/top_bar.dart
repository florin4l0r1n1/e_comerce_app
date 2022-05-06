import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  VoidCallback onPressend;
  String text;

  CustomAppBar({
    Key key,
    this.text,
    this.onPressend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        children: [
          TextButton(
            onPressed: onPressend,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
