import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/feedback_screen/feedback_screen.dart';
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

  Widget _buildRequestItem({required Map request, required String? id}) {
    return GestureDetector(
      onTap: () {
        final requestDetail = Request.fromRTDB(request);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailRequestScreen(request: requestDetail)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 169,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 10,
            ),
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
              height: 10,
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
                  Icons.sort_outlined,
                  color: Colors.amberAccent,
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['status'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FeedbackScreen(id: id)),
                    );
                  },
                  child: request['status'] == "đã xử lí xong"
                      ? Row(
                          children: [
                            Icon(
                              Icons.rate_review,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(' Đánh giá',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      : Text(""),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh sách yêu cầu'),
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
