class UserModel {
  final String email;
  final String name;
  final String phoneNumber;
  final String password;

  UserModel({required this.email, required this.name, required this.phoneNumber,required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      password: json['password'],
    );
  }
}

