import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<RequestScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  String reqEmail = '';
  String reqProblem = '';
  String reqDescription = '';
  String reqDevice = '';
  String reqIdTeamView = '';
  String reqPassTeamView = '';
  String reqStatus = '';

  Widget _buildRequestItem({required Map request}) {
    return Container(
      height: 100,
      color: Colors.white,
      child: ListTile(
          leading: const Icon(Icons.computer),
          title: Text(request['device'] + " - " + request['problem']),
          subtitle: Text("Status: " + request['status']),
          onTap: () {
            // print("email: " + request['user_email']);
            // print("problem: " + request['problem']);
            // print("des: " + request['description']);
            // print("Status: " + request['status']);
            // print("id TV: " + request['id_teamView']);
            // print("pass TV: " + request['pass_TeamView']);
            final requestDetail = Request.fromRTDB(request);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailRequestScreen(request: requestDetail)));
          }),
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
