import 'package:e_comerce_app/models/item_model.dart';
import 'package:e_comerce_app/presentation/BloCs/item_bloc/bloc/item_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/item_validator__mixin.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemWidget extends StatelessWidget with ItemValidatorMixin {
  const AddItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Item item;
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
                        validator: (title) {
                          if (isTitleValid(title)) {
                            item = Item(
                                title: title, description: "", pictureUrl: "");
                          }
                        },
                        labelText: 'Title',
                        hintText: 'ItemName')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                      validator: (description) {
                        if (isDescriptionValid(description)) {
                          item = Item(
                              title: "",
                              description: description,
                              pictureUrl: "");
                        }
                      },
                      labelText: 'Description',
                      hintText: 'hintText'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                      child: CustomTextFormField(
                          validator: (image) {
                            if (isImageValid(image)) {
                              item = Item(
                                  title: "",
                                  description: '',
                                  pictureUrl: 'ImageFromCamera or galery');
                            }
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
                        onPressed: () {},
                        child: const Text('Camera'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addItem(context, item);
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
}

void _addItem(BuildContext context, Item items) {
  BlocProvider.of<ItemBloc>(context).add(AddItemRequested(items));
}
