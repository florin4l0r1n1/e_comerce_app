mixin ItemValidatorMixin {
  bool isTitleValid(String title) => title.length > 5 && title.length != null;

  bool isDescriptionValid(String description) =>
      description.length > 10 && description.length != null;

  bool isImageValid(String image) => image != null;
}
