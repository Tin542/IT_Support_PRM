import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final User? user = FirebaseAuth.instance.currentUser;
//Users
DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");

//Request
DatabaseReference reqRef =
    FirebaseDatabase.instance.reference().child("requests");

//get Email
DatabaseReference emailCurrent = FirebaseDatabase.instance
    .reference()
    .child("users")
    .child(user!.uid)
    .child('email');
