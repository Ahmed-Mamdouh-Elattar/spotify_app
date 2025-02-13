class UserModel {
  final String email;
  final String name;
  List<dynamic> favorites = [];

  UserModel({required this.email, required this.name, required this.favorites});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      favorites: json['favorites'],
    );
  }
}
