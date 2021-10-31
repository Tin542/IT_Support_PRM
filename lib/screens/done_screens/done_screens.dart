import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/feedback_screen/feedback_screen.dart';
import 'package:it_support/screens/payment_screen/payment_screen.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class donescreen extends StatefulWidget {
  const donescreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<donescreen> {
  User? user = FirebaseAuth.instance.currentUser;
  String reqEmail = '';
  String reqProblem = '';
  String reqDescription = '';
  String reqDevice = '';
  String reqIdTeamView = '';
  String reqPassTeamView = '';
  String reqStatus = '';

  Widget _buildRequestItem({required Map request, required String? id}) {
    return GestureDetector(
      onTap: () {
        final requestDetail = Request.fromRTDB(request);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRequestScreen(
              request: requestDetail,
              id: id,
            ),
          ),
        );
      },
      child: request['status'] == 'Đã xử lí xong'
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.devices_other_outlined,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        request['device'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.report_problem,
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.purple,
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        request['user_email'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.paid,
                        color: Colors.yellow[900],
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(request['price'],
                          style: TextStyle(color: Colors.yellow[900])),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Status: "),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        request['status'],
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Text(""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: reqRef.orderByChild("user_email").equalTo(user!.email),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value;
            String? key = snapshot.key;
            return _buildRequestItem(request: request, id: key);
          },
        ),
      ),
    );
  }
}
