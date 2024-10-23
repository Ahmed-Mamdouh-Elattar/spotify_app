String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return "Please enter a password";
  } else if (password.length < 6) {
    return "Password must be at least 6 characters long";
  } else {
    return null;
  }
}
