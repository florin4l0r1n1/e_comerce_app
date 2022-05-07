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
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 10,
            color: Colors.green,
            child: Column(
              children: const [
                SizedBox(),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: ' Title'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: ' Description'),
                  ),
                ),
                Expanded(
                  child: Text('Image'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addItem(BuildContext context) {
    print("Add");
  }
}
