class User {
  final int id;
  final String email;
  final String name;
  final String role;
  final String avatar;
  String? password;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.avatar,
  });
}
