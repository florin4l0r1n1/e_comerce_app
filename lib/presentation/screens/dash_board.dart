import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("DashBoard")),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("DashBoard"),
      ),
    );
  }
}
