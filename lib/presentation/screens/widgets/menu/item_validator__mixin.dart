mixin ItemValidatorMixin {
  bool isTitleValid(String title) => (title.length > 10 && title.length < 30);

  bool isDescriptionValid(String description) =>
      (description.length > 20 && description.length < 200);

  bool isImageValid(String image) => image != null;
}
