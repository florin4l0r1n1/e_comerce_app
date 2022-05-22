import 'package:e_comerce_app/models/item_model.dart';
import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/BloCs/image_bloc/image_piker_bloc.dart';
import 'package:e_comerce_app/presentation/BloCs/item_bloc/bloc/item_bloc.dart';

import 'package:e_comerce_app/presentation/screens/widgets/menu/item_validator__mixin.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_picker/images_picker.dart';

class AddItemWidget extends StatefulWidget {
  AddItemWidget({Key key}) : super(key: key);

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> with ItemValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).colorScheme.primary,
        child: Card(
          shadowColor: Theme.of(context).colorScheme.secondaryVariant,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 15,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                        obscureText: false,
                        validator: (title) {},
                        labelText: 'Title',
                        hintText: 'ItemName')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                      obscureText: false,
                      validator: (description) {
                        if (isDescriptionValid(description)) {}
                      },
                      labelText: 'Description',
                      hintText: 'hintText'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                      child: CustomTextFormField(
                          obscureText: false,
                          validator: (image) {
                            if (isImageValid(image)) {}
                          },
                          labelText: 'Image',
                          hintText: "Image")),
                ),
                const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("Camera");
                        },
                        child: const Text('Camera'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("gallety");
                        },
                        child: const Text('Gallery'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    List<Media> res =
        await ImagesPicker.pick(count: 3, pickType: PickType.image);
    return res;
  }

  addItem(BuildContext context,
      [String title, String description, String imageUrl, double price]) {
    Item item = Item(
        title: title,
        description: "description",
        pictureUrl: imageUrl,
        price: price);
    print("Item Added");
    try {
      BlocProvider.of<ItemBloc>(context).add(AddItemRequested(item));
    } catch (e) {
      print(e.toString());
    }
  }
}
