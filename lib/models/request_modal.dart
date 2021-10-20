import 'package:firebase_database/firebase_database.dart';

class Request {
  final String problem;
  final String description;
  final String device;
  final String teamViewID;
  final String teamViewPass;

  Request({
    required this.problem,
    required this.description,
    required this.device,
    required this.teamViewID,
    required this.teamViewPass,
  });

  factory Request.fromRTDB(Map<String, dynamic> data) {
    return Request(
      problem: data['problem'] ?? 'null',
      description: data['description'] ?? 'null',
      device: data['device'] ?? 'null',
      teamViewID: data['id_teamView'] ?? 'null',
      teamViewPass: data['pass_TeamView'] ?? 'null',
    );
  }

  // Request.fromSnapshot(DataSnapshot snapshot)
  //     :
  //       // id = snapshot.key,
  //       problem = snapshot.value["problem"],
  //       description = snapshot.value["description"],
  //       device = snapshot.value["device"],
  //       teamViewID = snapshot.value["id_teamView"],
  //       teamViewPass = snapshot.value["pass_TeamView"];

  // toJson() {
  //   return {
  //     "problem": problem,
  //     "description": description,
  //     "device": device,
  //     "teamViewID": teamViewID,
  //     "teamViewPass": teamViewPass,
  //   };
  // }
}
