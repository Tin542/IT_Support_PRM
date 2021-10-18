import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:it_support/screens/components/dropdown_button.dart';
import 'package:it_support/screens/components/dropdown_button_type.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/it_support_list_screen.dart';

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'components/load_image.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  int currentStep = 0;
  bool complete = false;
  StepperType stepperType = StepperType.horizontal;
  StepState stepState = StepState.editing;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  swtichStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  List<Step> steps = [
    Step(
      title: const Text("Thiết bị"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: const <Widget>[
          Text(
            "Chọn thiết bị của bạn: ",
            textAlign: TextAlign.left,
          ),
          RoundedDropdownButton(),
        ],
      ),
    ),
    Step(
      title: const Text("Loại thiết bị"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: const <Widget>[
          Text(
            "Loại thiết bị: ",
            textAlign: TextAlign.left,
          ),
          DropdownButtonType(),
        ],
      ),
    ),
    Step(
      title: const Text("Vấn đề"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          RoundedInputField(
              hintText: "Vấn đề của bạn là gì ?", onChanged: (value) {}),
        ],
      ),
    ),
    Step(
      title: const Text("Ảnh/Video"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[Text("Thêm ảnh hoặc video minh họa"), LoadImage()],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ITSupport"),
        ),
        body: Column(children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                      child: AlertDialog(
                    title: new Text("Request complete"),
                    content: const Text("choose supporter you want"),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("next"),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: backtoListItScreen));
                        },
                      ),
                    ],
                  )),
                )
              : Expanded(
                  child: Stepper(
                    steps: steps,
                    // type: stepperType,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepCancel: cancel,
                    onStepTapped: (step) => goTo(step),
                  ),
                ),
        ]));
  }

  Widget backtoListItScreen(BuildContext context) {
    return ListItScreen();
  }
}

