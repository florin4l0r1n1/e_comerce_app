import 'package:e_comerce_app/presentation/screens/menu/add_item_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/favorite_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/profile_screen.dart';

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _DashBoardState();
}

class _DashBoardState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text(
                "logOut",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: ,
      body: const Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
