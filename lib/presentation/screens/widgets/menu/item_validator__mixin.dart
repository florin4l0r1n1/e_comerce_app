mixin ItemValidatorMixin {
  bool isTitleValid(String title) => (title != null);

  bool isDescriptionValid(String description) => (description != null);

  bool isImageValid(String image) => image != null;
}
