import 'package:flutter/material.dart';
import 'package:it_support/screens/components/backgound.dart';
import 'package:it_support/screens/components/dropdown_button.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/it_support_list_screen.dart';

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         ClipRRect(
//           borderRadius: BorderRadius.circular(25),
//           child: Image.asset(
//             "assets/images/Banner.png",
//             width: size.width * 0.8,
//           ),
//         ),
//         SizedBox(height: size.height * 0.03),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(25),
//           child: Container(
//             width: size.width * 0.8,
//             color: Color(0xFFCFE9F1),
//             // color: Colors.blueGrey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RoundedDropdownButton(),
//                 RoundedInputField(
//                     hintText: "What's your problem...", onChanged: (value) {}),
//                 RoundedInputField(
//                     hintText: "Explan your problem by picture...",
//                     onChanged: (value) {},
//                     icon: Icons.drive_folder_upload),
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: backtoListItScreen));
//                   },
//                   child: Text(
//                     "SUBMIT",
//                     style: TextStyle(color: Colors.blue, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     ));
//   }

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int currentStep = 0;
  bool complete = false;
  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  goTo(int step) {
    currentStep = step;
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  List<Step> steps = [
    Step(
      title: const Text("Title"),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(decoration: InputDecoration(labelText: "Email")),
          TextFormField(decoration: InputDecoration(labelText: "Password")),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ITSupport"),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step),
            ),
          ),
        ]));
  }
}
