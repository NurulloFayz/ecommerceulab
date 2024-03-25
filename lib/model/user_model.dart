class UserModel {
  final String email;
  final String name;
  final String phoneNumber;

  UserModel({required this.email, required this.name, required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phone_number'],
    );
  }
}

