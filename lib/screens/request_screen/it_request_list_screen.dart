import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<RequestScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  // final _ref =
  //     FirebaseDatabase.instance.reference().child('requests').child(user!.uid);

  Widget _buildRequestItem({required Map request}) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['problem'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách yêu cầu'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: reqRef.orderByChild("user_email").equalTo(user!.email),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value;
            return _buildRequestItem(request: request);
          },
        ),
      ),
    );
  }
}
