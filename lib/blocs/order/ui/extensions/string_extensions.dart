
extension StringExtensions on String {
  String get removeEmptySpace => replaceAll(" ", "");

  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}