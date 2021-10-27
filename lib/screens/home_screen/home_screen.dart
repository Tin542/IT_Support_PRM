import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/chatbot_screen/chatbot_screen.dart';
import 'package:it_support/screens/home_screen/body.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  User? user = FirebaseAuth.instance.currentUser;

  String userName = '';

  void getName() {
    usersRef.child(user!.uid).child('name').onValue.listen((event) {
      final String name = event.snapshot.value;
      setState(() {
        userName = '$name';
        print("name: " + userName);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Xin chào, " + userName),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.smart_toy),
              color: Colors.white,
              onPressed: () {
                Get.to(const ChatBotScreen(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 600));
              },
            )
          ],
        ),
        body: const Body());
  }
}
