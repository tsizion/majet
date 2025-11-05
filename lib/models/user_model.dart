class AppUser {
  final int id;
  final DateTime createdAt;
  final String? fullName;
  final String? email;
  final bool approved;
  final String role;

  AppUser({
    required this.id,
    required this.createdAt,
    this.fullName,
    this.email,
    this.approved = false,
    this.role = 'consumer',
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      approved: json['approved'] ?? false,
      role: json['role'] ?? 'consumer',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'full_name': fullName,
      'email': email,
      'approved': approved,
      'role': role,
    };
  }
}
