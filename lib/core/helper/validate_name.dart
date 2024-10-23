bool isValidName(String name) {
  // RegEx for validating name (letters and spaces only)
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  return nameRegExp.hasMatch(name) && name.isNotEmpty;
}

String? validataName(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your name";
  } else if (value.length < 2) {
    return "Name must be at least 2 characters long";
  } else if (!isValidName(value)) {
    return "Please enter a valid name";
  } else {
    return null;
  }
}
