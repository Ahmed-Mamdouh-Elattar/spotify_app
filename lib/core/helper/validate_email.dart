bool isValidEmail(String email) {
  // RegEx for validating email format
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegExp.hasMatch(email);
}

String? validateEmail(String? email) {
  if (!isValidEmail(email ?? "")) {
    return "please enter a valid email";
  } else {
    return null;
  }
}
