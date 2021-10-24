import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/chatbot_screen/chatbot_screen.dart';
import 'package:it_support/screens/home_screen/body.dart';

import 'dart:ui';

import '../components/load_image.dart';

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
    // TODO: implement initState
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
              icon: Icon(Icons.smart_toy),
              color: Colors.white,
              onPressed: () {
                Get.to(ChatBotScreen(),
                    transition: Transition.downToUp,
                    duration: Duration(milliseconds: 600));
              },
            )
          ],
        ),
        body: Body());
  }
}
