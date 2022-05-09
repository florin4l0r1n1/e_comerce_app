import 'package:e_comerce_app/presentation/screens/widgets/menu/add_item_widget.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/top_bar.dart';
import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              onPressend: () => _addItem(context),
              text: "AddItem",
            ),
          ),
          body: const AddItemWidget()),
    );
  }

  void _addItem(BuildContext context) {
    print("Add");
  }
}
