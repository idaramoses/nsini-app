class UserModel {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String country;
  final String role;
  final String status;
  final String uniqueId;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.country,
    required this.role,
    required this.status,
    required this.uniqueId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'] ?? '',
      firstname: json['firstName'] ?? '',
      lastname: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      uniqueId: json['uniqueId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'country': country,
      'role': role,
      'status': status,
      'uniqueId': uniqueId,
    };
  }
}
