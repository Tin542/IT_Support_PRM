class Customer {
  final String email;
  final String gender;
  final String name;
  final String phone;
  Customer({
    required this.email,
    required this.gender,
    required this.name,
    required this.phone,
  });

  factory Customer.fromRTDB(Map<String, dynamic> data) {
    return Customer(
      email: data['email'] ?? '',
      gender: data['gender'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
    );
  }
}
