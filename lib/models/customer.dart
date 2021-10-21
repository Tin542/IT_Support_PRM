import 'package:firebase_database/firebase_database.dart';

import 'package:it_support/firebase_database/database.dart';

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
// void getEmail() {
//     usersRef.child(user!.uid).onValue.listen((event) {
//       // final data = new Map<String, dynamic>.from(event.snapshot.value);
//       // final email = data['email'] as String;
//       final email = event.snapshot.value.email.toString;
//       final String 
//     });
//   }
