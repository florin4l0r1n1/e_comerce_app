import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:e_comerce_app/models/item_model.dart';
import 'package:e_comerce_app/presentation/BloCs/image_bloc/image_piker_bloc.dart';
import 'package:e_comerce_app/presentation/BloCs/item_bloc/bloc/item_bloc.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/item_validator__mixin.dart';
import 'package:e_comerce_app/presentation/screens/widgets/menu/top_bar.dart';
import 'package:e_comerce_app/presentation/screens/widgets/utils/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_picker/images_picker.dart';
import 'package:image_picker/image_picker.dart';

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
    return BlocBuilder<ImagePikerBloc, ImagePikerState>(
      builder: (context, state) {
        if (state is OnPiked) {
          _cont(context);
        }
        if (state is OnImagePiked) {
          _buildBody(context);
        }

        return _buildBody(context);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    List<File> image;

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
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: Card(
                                elevation: 20,
                                color: Colors.black,
                                child: Column(
                                  children: <Widget>[
                                    Image.file((image[index]))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              print("Camera");
                              image = (await _picker.getImage(
                                  source: ImageSource.camera)) as List<File>;
                            },
                            child: const Text('Camera'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              print("Gellery");

                              image = (await _picker.getImage(
                                  source: ImageSource.gallery)) as List<File>;
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
        ),
      ),
    );
  }

  Widget _cont(BuildContext buildContext) {
    return Container(
      child: Text("ImgPiked"),
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
