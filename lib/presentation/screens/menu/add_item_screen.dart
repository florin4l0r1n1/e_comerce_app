import 'package:e_comerce_app/models/item_model.dart';
import 'package:e_comerce_app/presentation/BloCs/item_bloc/bloc/item_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/item_validator__mixin.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/top_bar.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItem extends StatelessWidget with ItemValidatorMixin {
  AddItem({
    Key key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String title1;
  String image1;
  String description1;
  double price1;

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
            onPressend: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _addItem(context, title1, description1, image1, price1);
              }
            },
            text: "AddItem",
          ),
        ),
        body: SingleChildScrollView(
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
                            validator: (title) {
                              if (isTitleValid(title)) {
                                title1 = title;
                              } else {
                                return "Please give a title";
                              }
                            },
                            labelText: 'Title',
                            hintText: 'ItemName')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                          obscureText: false,
                          validator: (description) {
                            if (isDescriptionValid(description)) {
                              description1 = description;
                            } else {
                              return "Decription should be minim 20 characters";
                            }
                          },
                          labelText: 'Description',
                          hintText: 'hintText'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                          obscureText: false,
                          validator: (image) {
                            if (isImageValid(image)) {
                              image1 = image;
                            } else {
                              "Please select an image";
                            }
                          },
                          labelText: 'Image',
                          hintText: "Image"),
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
                            onPressed: () {},
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
        ),
      ),
    );
  }

  _addItem(BuildContext context,
      [String title, String description, String image, double price]) {
    Item item = Item(
        title: title,
        description: description,
        pictureUrl: image,
        price: price);
    try {
      BlocProvider.of<ItemBloc>(context).add(AddItemRequested(item));
    } catch (e) {
      print(e.toString());
    }
  }
}
