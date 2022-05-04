import 'package:e_comerce_app/presentation/screens/widgets/menu/top_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            onPressend: () => _buyItems(),
            text: "Buy",
          ),
        ),
        body: Container(
          color: Colors.grey,
          child: Center(child: Text("Cart")),
        ),
      ),
    );
  }

  _buyItems() {}
}
